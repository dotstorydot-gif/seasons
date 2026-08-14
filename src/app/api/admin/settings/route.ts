import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';
import { checkAdminSecret } from '@/lib/adminAuth';

export async function POST(req: NextRequest) {
    const authError = checkAdminSecret(req);
    if (authError) return authError;

    let body: { payload?: Record<string, unknown> };
    try {
        body = await req.json();
    } catch {
        return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { payload } = body;
    if (!payload || typeof payload !== 'object') {
        return NextResponse.json({ error: 'payload is required' }, { status: 400 });
    }

    // Reuse existing primary key ID if table already has a row (e.g. 1 or 'default')
    const { data: existing } = await supabaseAdmin.from('settings').select('id').limit(1).maybeSingle();
    const targetId = existing?.id !== undefined && existing?.id !== null ? existing.id : '1';

    const cleanPayload = {
        id: targetId,
        ...payload,
        updated_at: new Date().toISOString(),
    };

    const { error } = await supabaseAdmin.from('settings').upsert(cleanPayload);
    if (error) {
        console.error('Error saving settings in API route:', error);
        return NextResponse.json({ error: error.message }, { status: 500 });
    }
    return NextResponse.json({ success: true });
}
