import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';
import { checkAdminSecret } from '@/lib/adminAuth';

export async function POST(req: NextRequest) {
    const authError = checkAdminSecret(req);
    if (authError) return authError;

    let body: { payload?: unknown };
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { payload } = body;
    if (!payload || typeof payload !== 'object') {
        return NextResponse.json({ error: 'payload is required' }, { status: 400 });
    }

    const { error } = await supabaseAdmin.from('coupons').insert([payload]);
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ success: true });
}

export async function PUT(req: NextRequest) {
    const authError = checkAdminSecret(req);
    if (authError) return authError;

    let body: { id?: unknown; is_active?: unknown };
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { id, is_active } = body;
    if (!id || typeof id !== 'string') {
        return NextResponse.json({ error: 'id is required' }, { status: 400 });
    }
    if (typeof is_active !== 'boolean') {
        return NextResponse.json({ error: 'is_active must be a boolean' }, { status: 400 });
    }

    const { error } = await supabaseAdmin.from('coupons').update({ is_active }).eq('id', id);
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ success: true });
}

export async function DELETE(req: NextRequest) {
    const authError = checkAdminSecret(req);
    if (authError) return authError;

    let body: { id?: unknown };
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { id } = body;
    if (!id || typeof id !== 'string') {
        return NextResponse.json({ error: 'id is required' }, { status: 400 });
    }

    const { error } = await supabaseAdmin.from('coupons').delete().eq('id', id);
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ success: true });
}
