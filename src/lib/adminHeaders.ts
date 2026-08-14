/**
 * Returns the headers needed for admin API calls, including the ADMIN_SECRET guard header.
 */
export function adminHeaders(extra?: Record<string, string>): Record<string, string> {
    const secret = process.env.NEXT_PUBLIC_ADMIN_SECRET || process.env.ADMIN_SECRET || '';
    return {
        'Content-Type': 'application/json',
        'x-admin-secret': secret,
        ...extra,
    };
}

