import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';

const SHIPPING_FEE = 30;

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
    return `ORD-${Math.random().toString(36).substring(2, 11).toUpperCase()}`;
}

export async function POST(req: NextRequest) {
    let body: CheckoutBody;
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { formData, items, couponCode, previewOnly } = body;

    // --- Input validation ---
    if (!formData || typeof formData !== 'object') {
        return NextResponse.json({ error: 'formData is required' }, { status: 400 });
    }
    if (!formData.fullName || !formData.phone || !formData.city || !formData.area || !formData.address) {
        return NextResponse.json({ error: 'Missing required delivery fields' }, { status: 400 });
    }
    if (!Array.isArray(items) || items.length === 0) {
        return NextResponse.json({ error: 'Cart is empty' }, { status: 400 });
    }
    if (items.some(i => !i.id || typeof i.quantity !== 'number' || i.quantity < 1)) {
        return NextResponse.json({ error: 'Invalid cart items' }, { status: 400 });
    }

    // --- Re-fetch prices from DB (never trust client-sent prices) ---
    const productIds = items.map(i => i.id);
    const { data: products, error: productsError } = await supabaseAdmin
        .from('products')
        .select('id, name_en, name_ar, price')
        .in('id', productIds);

    if (productsError || !products || products.length !== productIds.length) {
        return NextResponse.json({ error: 'One or more products not found' }, { status: 400 });
    }

    const productMap = Object.fromEntries(products.map(p => [p.id, p]));

    // Compute subtotal from server-fetched prices
    const subtotal = items.reduce((sum, item) => {
        const product = productMap[item.id];
        return sum + product.price * item.quantity;
    }, 0);

    // --- Coupon validation (server-side) ---
    let discount = 0;
    let shippingFee = SHIPPING_FEE;
    let appliedCouponId: string | null = null;
    let appliedCouponCode: string | null = null;
    let appliedCouponUsedCount = 0;
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
        appliedCouponId = coupon.id;
        appliedCouponCode = coupon.code;
        appliedCouponUsedCount = coupon.used_count;

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

    // --- Insert order via supabaseAdmin ---
    const { data: orderData, error: orderError } = await supabaseAdmin
        .from('orders')
        .insert([{
            order_number: orderNumber,
            full_name: formData.fullName,
            email: formData.email || null,
            phone: formData.phone,
            alt_phone: formData.altPhone || null,
            city: formData.city,
            area: formData.area,
            address: formData.address,
            delivery_notes: formData.notes || null,
            total_amount: finalTotal,
            status: 'processing',
            coupon_code: appliedCouponCode,
            discount_amount: discount,
            items: items.map(item => ({
                id: item.id,
                nameEn: productMap[item.id].name_en,
                nameAr: productMap[item.id].name_ar,
                price: productMap[item.id].price,
                quantity: item.quantity,
            })),
        }])
        .select('id')
        .single();

    if (orderError || !orderData) {
        console.error('Order insert error:', orderError);
        return NextResponse.json({ error: 'Failed to place order' }, { status: 500 });
    }

    // --- Atomically record coupon usage & increment used_count ---
    if (appliedCouponId && orderData.id) {
        await supabaseAdmin.from('coupon_usages').insert([{
            coupon_id: appliedCouponId,
            order_id: orderData.id,
            user_phone: formData.phone,
        }]);

        await supabaseAdmin
            .from('coupons')
            .update({ used_count: appliedCouponUsedCount + 1 })
            .eq('id', appliedCouponId);
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
            totalAmount: finalTotal,
            items: emailItems,
        }),
    }).catch(e => console.error('Email send failed:', e));

    return NextResponse.json({
        success: true,
        orderNumber,
        finalTotal,
        discountType: couponDiscountType,
        discount,
    });
}
