import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';

function checkAdminSecret(req: NextRequest): NextResponse | null {
    const secret = req.headers.get('x-admin-secret');
    if (!process.env.ADMIN_SECRET || secret !== process.env.ADMIN_SECRET) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }
    return null;
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
    if (!payload || typeof payload !== 'object') {
        return NextResponse.json({ error: 'payload is required' }, { status: 400 });
    }

    const { error } = await supabaseAdmin.from('settings').upsert([payload]);
    if (error) return NextResponse.json({ error: error.message }, { status: 500 });
    return NextResponse.json({ success: true });
}
