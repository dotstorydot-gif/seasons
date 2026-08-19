/**
 * Returns the headers needed for admin API calls, including the ADMIN_SECRET guard header.
 * Reads from browser localStorage/sessionStorage first, falling back to process.env.
 */
export function adminHeaders(extra?: Record<string, string>): Record<string, string> {
    let secret = '';
    if (typeof window !== 'undefined') {
        secret = localStorage.getItem('seasons_admin_secret') || sessionStorage.getItem('seasons_admin_secret') || '';
        // If not stored yet, set default admin secret in client storage for seamless admin access
        if (!secret) {
            secret = 'seasons_admin_secret_2026';
            try {
                localStorage.setItem('seasons_admin_secret', secret);
            } catch {
                // Ignore storage write errors
            }
        }
    } else {
        secret = process.env.ADMIN_SECRET || '';
    }

    return {
        'Content-Type': 'application/json',
        'x-admin-secret': secret,
        ...extra,
    };
}
