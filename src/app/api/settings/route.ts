import { NextResponse } from 'next/server';
import { fetchStoreSettings } from '@/lib/settings';

export async function GET() {
    try {
        const settings = await fetchStoreSettings();
        return NextResponse.json(settings);
    } catch {
        return NextResponse.json({ error: 'Failed to fetch settings' }, { status: 500 });
    }
}
