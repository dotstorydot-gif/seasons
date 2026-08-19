import { NextRequest, NextResponse } from 'next/server';

/**
 * Validates admin request authorization using x-admin-secret header.
 * Secret MUST match server process.env.ADMIN_SECRET (or default fallback).
 */
export function checkAdminSecret(req: NextRequest): NextResponse | null {
    const secret = req.headers.get('x-admin-secret');
    const envSecret = process.env.ADMIN_SECRET || 'seasons_admin_secret_2026';

    // Require valid header matching configured admin secret
    if (!secret || secret !== envSecret) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    return null; // Authorized
}
