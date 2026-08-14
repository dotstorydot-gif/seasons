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

    // Ensure settings record always updates singleton 'default' row
    const cleanPayload = {
        id: 'default',
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
