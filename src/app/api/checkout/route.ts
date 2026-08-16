import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';
import { fetchStoreSettings } from '@/lib/settings';
import { checkRateLimit } from '@/lib/rateLimit';

import { randomUUID } from 'crypto';

type CartItem = { id: string; quantity: number };

interface CheckoutBody {
    formData?: {
        fullName?: string;
        email?: string;
        phone?: string;
        altPhone?: string;
        city?: string;
        area?: string;
        address?: string;
        notes?: string;
    };
    items?: CartItem[];
    couponCode?: string;
    previewOnly?: boolean;
}

function generateOrderNumber() {
    const timestamp = Date.now().toString(36).toUpperCase();
    const uniqueSuffix = randomUUID().replace(/-/g, '').substring(0, 6).toUpperCase();
    return `ORD-${timestamp}-${uniqueSuffix}`;
}

export async function POST(req: NextRequest) {
    // --- Rate limiting: max 5 checkout attempts per 10 minutes per IP ---
    const rateLimitError = checkRateLimit(req, { limit: 5, windowMs: 10 * 60 * 1000 });
    if (rateLimitError) return rateLimitError;

    let body: CheckoutBody;
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { formData, items: rawItems, couponCode, previewOnly } = body;

    // --- Input validation ---
    if (!formData || typeof formData !== 'object') {
        return NextResponse.json({ error: 'formData is required' }, { status: 400 });
    }
    if (!formData.fullName?.trim() || !formData.phone?.trim() || !formData.city?.trim() || !formData.area?.trim() || !formData.address?.trim()) {
        return NextResponse.json({ error: 'Missing required delivery fields' }, { status: 400 });
    }
    if (!Array.isArray(rawItems) || rawItems.length === 0) {
        return NextResponse.json({ error: 'Cart is empty' }, { status: 400 });
    }

    // Normalize cart to aggregate duplicate product IDs & enforce integer bounds (1 <= quantity <= 100)
    const itemMap = new Map<string, number>();
    for (const item of rawItems) {
        if (!item.id || typeof item.id !== 'string' || typeof item.quantity !== 'number') {
            return NextResponse.json({ error: 'Invalid cart item structure' }, { status: 400 });
        }
        if (!Number.isInteger(item.quantity) || item.quantity < 1 || item.quantity > 100) {
            return NextResponse.json({ error: 'Item quantity must be an integer between 1 and 100' }, { status: 400 });
        }
        itemMap.set(item.id, (itemMap.get(item.id) || 0) + item.quantity);
    }

    const items: CartItem[] = Array.from(itemMap.entries()).map(([id, quantity]) => ({ id, quantity }));

    // --- Re-fetch prices & stock from DB (never trust client-sent values) ---
    const productIds = items.map(i => i.id);
    const { data: products, error: productsError } = await supabaseAdmin
        .from('products')
        .select('id, name_en, name_ar, price, stock')
        .in('id', productIds);

    if (productsError || !products || products.length !== productIds.length) {
        return NextResponse.json({ error: 'One or more products not found' }, { status: 400 });
    }

    const productMap = Object.fromEntries(products.map(p => [p.id, p]));

    // Check stock availability
    for (const item of items) {
        const prod = productMap[item.id];
        if (prod.stock < item.quantity) {
            return NextResponse.json({
                error: `Product "${prod.name_en}" is out of stock (Available: ${prod.stock}, Requested: ${item.quantity})`
            }, { status: 400 });
        }
    }

    // Compute subtotal from server-fetched prices
    const subtotal = items.reduce((sum, item) => {
        const product = productMap[item.id];
        return sum + product.price * item.quantity;
    }, 0);

    // Fetch dynamic store settings (shipping fee, free shipping threshold, tax rules)
    const settings = await fetchStoreSettings();
    const isFreeByThreshold = settings.free_shipping_threshold > 0 && subtotal >= settings.free_shipping_threshold;

    // --- Coupon validation (server-side) ---
    let discount = 0;
    let shippingFee = isFreeByThreshold ? 0 : settings.shipping_fee;
    let appliedCouponCode: string | null = null;
    let couponDiscountType: string | null = null;

    if (couponCode && couponCode.trim()) {
        const code = couponCode.trim().toUpperCase();

        const { data: coupon, error: couponError } = await supabaseAdmin
            .from('coupons')
            .select('*')
            .eq('code', code)
            .eq('is_active', true)
            .single();

        if (couponError || !coupon) {
            return NextResponse.json({ error: 'Invalid coupon code' }, { status: 400 });
        }

        if (coupon.expires_at && new Date(coupon.expires_at) < new Date()) {
            return NextResponse.json({ error: 'Coupon has expired' }, { status: 400 });
        }

        if (coupon.max_uses !== null && coupon.used_count >= coupon.max_uses) {
            return NextResponse.json({ error: 'Coupon has reached its usage limit' }, { status: 400 });
        }

        if (coupon.per_user_limit !== null && formData.phone) {
            const { count } = await supabaseAdmin
                .from('coupon_usages')
                .select('*', { count: 'exact', head: true })
                .eq('coupon_id', coupon.id)
                .eq('user_phone', formData.phone);

            if ((count ?? 0) >= coupon.per_user_limit) {
                return NextResponse.json({ error: 'You have already used this coupon' }, { status: 400 });
            }
        }

        couponDiscountType = coupon.discount_type;
        appliedCouponCode = coupon.code;

        if (coupon.discount_type === 'percentage') {
            discount = Math.round(subtotal * coupon.discount_value / 100);
        } else if (coupon.discount_type === 'free_delivery') {
            shippingFee = 0;
        }
    }

    const finalTotal = subtotal - discount + shippingFee;

    // --- Early return for coupon preview (no order insertion) ---
    if (previewOnly) {
        return NextResponse.json({
            success: true,
            discountType: couponDiscountType,
            discount,
            finalTotal,
        });
    }

    const orderNumber = generateOrderNumber();

    const formattedItems = items.map(item => ({
        id: item.id,
        quantity: item.quantity,
        nameEn: productMap[item.id].name_en,
        nameAr: productMap[item.id].name_ar,
        price: productMap[item.id].price,
    }));

    // --- Execute atomic database stored procedure place_order_atomic ---
    const { data: rpcResult, error: rpcError } = await supabaseAdmin.rpc('place_order_atomic', {
        p_order_number: orderNumber,
        p_full_name: formData.fullName.trim(),
        p_phone: formData.phone.trim(),
        p_alt_phone: formData.altPhone?.trim() || null,
        p_email: formData.email?.trim() || null,
        p_city: formData.city.trim(),
        p_area: formData.area.trim(),
        p_address: formData.address.trim(),
        p_delivery_notes: formData.notes?.trim() || null,
        p_coupon_code: appliedCouponCode,
        p_items: formattedItems,
        p_shipping_fee: shippingFee,
    });

    if (rpcError) {
        console.error('Atomic checkout RPC error:', rpcError);
        return NextResponse.json({ error: `Failed to process transactional checkout: ${rpcError.message}` }, { status: 500 });
    }

    // --- Fire confirmation email (non-blocking) ---
    const emailItems = items.map(item => ({
        name: productMap[item.id].name_en,
        price: productMap[item.id].price,
        quantity: item.quantity,
    }));

    fetch(`${req.nextUrl.origin}/api/send-confirmation`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            orderNumber,
            fullName: formData.fullName,
            phone: formData.phone,
            totalAmount: rpcResult?.final_total ?? finalTotal,
            items: emailItems,
        }),
    }).catch(e => console.error('Email send failed:', e));

    return NextResponse.json({
        success: true,
        orderNumber,
        finalTotal: rpcResult?.final_total ?? finalTotal,
        discountType: couponDiscountType,
        discount: rpcResult?.discount ?? discount,
    });
}

