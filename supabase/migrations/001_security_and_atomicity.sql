-- 1. Ensure email column exists on orders table
ALTER TABLE public.orders ADD COLUMN IF NOT EXISTS email TEXT;

-- 2. Revoke public SELECT on orders table to prevent customer PII exposure
DROP POLICY IF EXISTS "Allow anonymous order lookup" ON public.orders;

-- 2. Revoke public SELECT and INSERT policies on coupon_usages
DROP POLICY IF EXISTS "Allow public usage check" ON public.coupon_usages;
DROP POLICY IF EXISTS "Allow public coupon tracking" ON public.coupon_usages;

-- 3. Drop existing function signatures to resolve parameter overload conflicts
DROP FUNCTION IF EXISTS place_order_atomic(TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, JSONB);
DROP FUNCTION IF EXISTS place_order_atomic(TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, JSONB, NUMERIC);
DROP FUNCTION IF EXISTS place_order_atomic;

-- 4. Create stored procedure for atomic order placement, coupon validation, usage tracking, and stock reduction
CREATE OR REPLACE FUNCTION place_order_atomic(
    p_order_number TEXT,
    p_full_name TEXT,
    p_phone TEXT,
    p_alt_phone TEXT,
    p_email TEXT,
    p_city TEXT,
    p_area TEXT,
    p_address TEXT,
    p_delivery_notes TEXT,
    p_coupon_code TEXT,
    p_items JSONB,
    p_shipping_fee NUMERIC DEFAULT 75
)
RETURNS JSONB
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
DECLARE
    v_subtotal NUMERIC := 0;
    v_discount NUMERIC := 0;
    v_shipping_fee NUMERIC := COALESCE(p_shipping_fee, 75);
    v_final_total NUMERIC := 0;
    v_item RECORD;
    v_prod RECORD;
    v_coupon RECORD;
    v_applied_coupon_id UUID := NULL;
    v_applied_coupon_code TEXT := NULL;
    v_user_coupon_count INT := 0;
    v_order_id UUID;
    v_item_qty INT;
BEGIN
    -- A. Validate products & stock in loop
    FOR v_item IN SELECT * FROM jsonb_array_elements(p_items)
    LOOP
        v_item_qty := (v_item.value->>'quantity')::INT;

        -- DB-level quantity validation (defense in depth)
        IF v_item_qty IS NULL OR v_item_qty < 1 OR v_item_qty > 100 THEN
            RAISE EXCEPTION 'Invalid item quantity: must be an integer between 1 and 100';
        END IF;

        -- Lock product row for update to prevent overselling race conditions
        SELECT id, name_en, name_ar, price, stock
        INTO v_prod
        FROM public.products
        WHERE id = (v_item.value->>'id')::UUID
        FOR UPDATE;

        IF NOT FOUND THEN
            RAISE EXCEPTION 'Product % not found', (v_item.value->>'id');
        END IF;

        IF v_prod.stock < v_item_qty THEN
            RAISE EXCEPTION 'Insufficient stock for product % (Available: %, Requested: %)', v_prod.name_en, v_prod.stock, v_item_qty;
        END IF;

        v_subtotal := v_subtotal + (v_prod.price * v_item_qty);
    END LOOP;

    -- B. Validate coupon if provided
    IF p_coupon_code IS NOT NULL AND TRIM(p_coupon_code) <> '' THEN
        SELECT * INTO v_coupon
        FROM public.coupons
        WHERE code = UPPER(TRIM(p_coupon_code)) AND is_active = true
        FOR UPDATE;

        IF NOT FOUND THEN
            RAISE EXCEPTION 'Invalid coupon code';
        END IF;

        IF v_coupon.expires_at IS NOT NULL AND v_coupon.expires_at < NOW() THEN
            RAISE EXCEPTION 'Coupon has expired';
        END IF;

        IF v_coupon.max_uses IS NOT NULL AND v_coupon.used_count >= v_coupon.max_uses THEN
            RAISE EXCEPTION 'Coupon max usage limit reached';
        END IF;

        IF v_coupon.per_user_limit IS NOT NULL THEN
            SELECT COUNT(*) INTO v_user_coupon_count
            FROM public.coupon_usages
            WHERE coupon_id = v_coupon.id AND user_phone = TRIM(p_phone);

            IF v_user_coupon_count >= v_coupon.per_user_limit THEN
                RAISE EXCEPTION 'Coupon per-user limit reached for this phone number';
            END IF;
        END IF;

        v_applied_coupon_id := v_coupon.id;
        v_applied_coupon_code := v_coupon.code;

        -- Calculate discount
        IF v_coupon.discount_type = 'percentage' THEN
            v_discount := ROUND(v_subtotal * v_coupon.discount_value / 100);
        ELSIF v_coupon.discount_type = 'free_delivery' THEN
            v_shipping_fee := 0;
        END IF;
    END IF;

    v_final_total := GREATEST(0, v_subtotal - v_discount + v_shipping_fee);

    -- C. Decrement stock for all items
    FOR v_item IN SELECT * FROM jsonb_array_elements(p_items)
    LOOP
        v_item_qty := (v_item.value->>'quantity')::INT;
        UPDATE public.products
        SET stock = stock - v_item_qty
        WHERE id = (v_item.value->>'id')::UUID;
    END LOOP;

    -- D. Insert order
    INSERT INTO public.orders (
        order_number, full_name, phone, alt_phone, email,
        city, area, address, delivery_notes,
        total_amount, status, coupon_code, discount_amount, items
    ) VALUES (
        p_order_number, TRIM(p_full_name), TRIM(p_phone), NULLIF(TRIM(p_alt_phone), ''), NULLIF(TRIM(p_email), ''),
        TRIM(p_city), TRIM(p_area), TRIM(p_address), NULLIF(TRIM(p_delivery_notes), ''),
        v_final_total, 'processing', v_applied_coupon_code, v_discount, p_items
    )
    RETURNING id INTO v_order_id;

    -- E. Record coupon usage and increment coupon used_count
    IF v_applied_coupon_id IS NOT NULL THEN
        INSERT INTO public.coupon_usages (coupon_id, order_id, user_phone)
        VALUES (v_applied_coupon_id, v_order_id, TRIM(p_phone));

        UPDATE public.coupons
        SET used_count = used_count + 1
        WHERE id = v_applied_coupon_id;
    END IF;

    RETURN jsonb_build_object(
        'order_id', v_order_id,
        'order_number', p_order_number,
        'final_total', v_final_total,
        'discount', v_discount
    );
END;
$$;

-- 5. Restrict RPC function execution privileges to service_role only
REVOKE EXECUTE ON FUNCTION place_order_atomic(TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, JSONB, NUMERIC) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION place_order_atomic(TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, JSONB, NUMERIC) TO service_role;
