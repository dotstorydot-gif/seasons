-- ============================================================
-- Coupons table for Seasons Wooden Aesthetic
-- Run this in the Supabase SQL Editor
-- ============================================================
CREATE TABLE IF NOT EXISTS public.coupons (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    -- Coupon identifier
    code TEXT UNIQUE NOT NULL,
    -- Discount type: 'percentage' or 'free_delivery'
    discount_type TEXT NOT NULL CHECK (discount_type IN ('percentage', 'free_delivery')),
    -- Value: for percentage → e.g. 15 means 15% off. Ignored for free_delivery.
    discount_value NUMERIC DEFAULT 0,
    -- Usage limits
    max_uses INTEGER DEFAULT NULL,
    -- NULL = unlimited
    used_count INTEGER DEFAULT 0,
    -- how many times used in total
    per_user_limit INTEGER DEFAULT NULL,
    -- NULL = unlimited per user
    -- Validity
    is_active BOOLEAN DEFAULT true,
    expires_at TIMESTAMPTZ DEFAULT NULL,
    -- NULL = no expiry
    -- Audit
    created_at TIMESTAMPTZ DEFAULT now()
);
-- Track usage per user (by phone number since no auth)
CREATE TABLE IF NOT EXISTS public.coupon_usages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    coupon_id UUID REFERENCES public.coupons(id) ON DELETE CASCADE,
    order_id UUID REFERENCES public.orders(id) ON DELETE
    SET NULL,
        user_phone TEXT NOT NULL,
        used_at TIMESTAMPTZ DEFAULT now()
);
-- Example coupons to get started
INSERT INTO public.coupons (
        code,
        discount_type,
        discount_value,
        max_uses,
        per_user_limit,
        is_active
    )
VALUES ('WELCOME10', 'percentage', 10, NULL, 1, true),
    ('FREESHIP', 'free_delivery', 0, 100, 1, true),
    ('SEASONS20', 'percentage', 20, 50, 1, true) ON CONFLICT (code) DO NOTHING;
-- Enable RLS and allow anon read for validation (write via service role only)
ALTER TABLE public.coupons ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.coupon_usages ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read active coupons" ON public.coupons FOR
SELECT USING (is_active = true);
CREATE POLICY "Service role full access coupons" ON public.coupons FOR ALL USING (true);
CREATE POLICY "Service role full access usages" ON public.coupon_usages FOR ALL USING (true);