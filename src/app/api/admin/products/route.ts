import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';
import { checkAdminSecret } from '@/lib/adminAuth';

const ALLOWED_PRODUCT_FIELDS = new Set([
    'name_en', 'name_ar', 'description_en', 'description_ar', 'price',
    'compare_at_price', 'sku', 'stock', 'is_featured', 'category_id',
    'images', 'size_en', 'size_ar', 'tags'
]);

function sanitizeProductPayload(payload: Record<string, unknown>): Record<string, unknown> {
    const clean: Record<string, unknown> = {};
    for (const [key, value] of Object.entries(payload)) {
        if (ALLOWED_PRODUCT_FIELDS.has(key)) {
            clean[key] = value;
        }
    }
    return clean;
}

export async function PUT(req: NextRequest) {
    const authError = checkAdminSecret(req);
    if (authError) return authError;

    let body: { id?: unknown; payload?: unknown };
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { id, payload } = body;
    if (!id || typeof id !== 'string') {
        return NextResponse.json({ error: 'id is required' }, { status: 400 });
    }
    if (!payload || typeof payload !== 'object' || payload === null) {
        return NextResponse.json({ error: 'payload object is required' }, { status: 400 });
    }

    const clean = sanitizeProductPayload(payload as Record<string, unknown>);

    const { error } = await supabaseAdmin.from('products').update(clean).eq('id', id);
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ success: true });
}

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
    if (!payload || typeof payload !== 'object' || payload === null) {
        return NextResponse.json({ error: 'payload object is required' }, { status: 400 });
    }

    const clean = sanitizeProductPayload(payload as Record<string, unknown>);

    const { data, error } = await supabaseAdmin.from('products').insert([clean]).select().single();
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ data });
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

    const { error } = await supabaseAdmin.from('products').delete().eq('id', id);
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ success: true });
}
