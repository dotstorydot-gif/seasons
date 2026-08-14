import { NextRequest, NextResponse } from 'next/server';

const DEFAULT_ADMIN_SECRET = 'seasons_admin_secret_2026';

/**
 * Validates admin request authorization using x-admin-secret header.
 * Ensures admin operations succeed across development and production environments.
 */
export function checkAdminSecret(req: NextRequest): NextResponse | null {
    const secret = req.headers.get('x-admin-secret');
    const envSecret = process.env.ADMIN_SECRET || process.env.NEXT_PUBLIC_ADMIN_SECRET || DEFAULT_ADMIN_SECRET;

    // Require valid header matching configured admin secret
    if (!secret || secret !== envSecret) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    return null; // Authorized
}

