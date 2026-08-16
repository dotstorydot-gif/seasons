import { NextRequest, NextResponse } from 'next/server';

interface RateLimitOptions {
    limit: number;
    windowMs: number;
}

const tracker = new Map<string, { count: number; expiresAt: number }>();

// Periodic cleanup of expired rate limit entries every 5 minutes
if (typeof setInterval !== 'undefined') {
    setInterval(() => {
        const now = Date.now();
        for (const [key, record] of tracker.entries()) {
            if (now > record.expiresAt) {
                tracker.delete(key);
            }
        }
    }, 5 * 60 * 1000);
}

export function checkRateLimit(req: NextRequest, options: RateLimitOptions): NextResponse | null {
    const ip = req.headers.get('x-forwarded-for')?.split(',')[0]?.trim() || req.headers.get('x-real-ip') || '127.0.0.1';
    const now = Date.now();
    const key = `${req.nextUrl.pathname}:${ip}`;

    const record = tracker.get(key);

    if (!record || now > record.expiresAt) {
        tracker.set(key, { count: 1, expiresAt: now + options.windowMs });
        return null;
    }

    if (record.count >= options.limit) {
        return NextResponse.json(
            { error: 'Too many requests. Please slow down and try again later.' },
            { status: 429 }
        );
    }

    record.count++;
    return null;
}
