import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';
import { checkAdminSecret } from '@/lib/adminAuth';

export async function GET(req: NextRequest) {
    const authError = checkAdminSecret(req);
    if (authError) return authError;

    const { searchParams } = new URL(req.url);
    const status = searchParams.get('status');

    let query = supabaseAdmin.from('orders').select('*').order('created_at', { ascending: false });
    if (status && status !== 'all') {
        query = query.eq('status', status);
    }

    const { data, error } = await query;
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ orders: data || [] });
}

export async function PUT(req: NextRequest) {
    const authError = checkAdminSecret(req);
    if (authError) return authError;

    let body: { id?: unknown; status?: unknown };
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { id, status } = body;
    if (!id || typeof id !== 'string') {
        return NextResponse.json({ error: 'id is required' }, { status: 400 });
    }

    const ALLOWED_STATUSES = ['pending', 'processing', 'ready_for_pickup', 'on_the_way', 'shipped', 'delivered', 'cancelled', 'returned'];
    if (!status || typeof status !== 'string' || !ALLOWED_STATUSES.includes(status)) {
        return NextResponse.json({ error: `status must be one of: ${ALLOWED_STATUSES.join(', ')}` }, { status: 400 });
    }

    const { error } = await supabaseAdmin.from('orders').update({ status }).eq('id', id);
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ success: true });
}
