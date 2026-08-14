import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';

export async function POST(req: NextRequest) {
    let body: { orderId?: unknown; phone?: unknown };
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { orderId, phone } = body;

    if (!orderId || typeof orderId !== 'string') {
        return NextResponse.json({ error: 'orderId is required' }, { status: 400 });
    }
    if (!phone || typeof phone !== 'string') {
        return NextResponse.json({ error: 'phone is required for verification' }, { status: 400 });
    }

    // Guard: only allow cancelling orders that match customer phone and are still in 'processing' status
    const { data: order, error: fetchError } = await supabaseAdmin
        .from('orders')
        .select('id, status, phone')
        .eq('id', orderId)
        .eq('phone', phone.trim())
        .single();

    if (fetchError || !order) {
        return NextResponse.json({ error: 'Order not found' }, { status: 404 });
    }

    if (order.status !== 'processing') {
        return NextResponse.json({ error: 'Only orders in processing status can be cancelled' }, { status: 409 });
    }

    const { error } = await supabaseAdmin
        .from('orders')
        .update({ status: 'cancelled' })
        .eq('id', orderId);

    if (error) {
        return NextResponse.json({ error: error.message }, { status: 500 });
    }

    return NextResponse.json({ success: true });
}
