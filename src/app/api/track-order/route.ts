import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';
import { checkRateLimit } from '@/lib/rateLimit';

export async function POST(req: NextRequest) {
    // --- Rate limiting: max 10 attempts per 5 minutes per IP ---
    const rateLimitError = checkRateLimit(req, { limit: 10, windowMs: 5 * 60 * 1000 });
    if (rateLimitError) return rateLimitError;

    let body: { orderNumber?: unknown; phone?: unknown };
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { orderNumber, phone } = body;

    if (!orderNumber || typeof orderNumber !== 'string') {
        return NextResponse.json({ error: 'orderNumber is required' }, { status: 400 });
    }
    if (!phone || typeof phone !== 'string') {
        return NextResponse.json({ error: 'phone is required' }, { status: 400 });
    }

    const { data, error } = await supabaseAdmin
        .from('orders')
        .select('order_number, status, items, total_amount, discount_amount, created_at, city, area')
        .eq('order_number', orderNumber.trim().toUpperCase())
        .eq('phone', phone.trim())
        .single();

    if (error || !data) {
        return NextResponse.json({ error: 'Order not found' }, { status: 404 });
    }

    return NextResponse.json({ order: data });
}
