import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';

interface ActiveVisitorMem {
    sessionId: string;
    path: string;
    deviceType: string;
    lastPing: number;
}

interface GlobalAnalyticsMemory {
    activeVisitors: Map<string, ActiveVisitorMem>;
    recentPageViews: Array<{
        sessionId: string;
        path: string;
        deviceType: string;
        referrer: string;
        timestamp: number;
    }>;
}

// Global in-memory cache for ultra-fast real-time traffic queries
const globalStore = globalThis as unknown as { __seasons_analytics?: GlobalAnalyticsMemory };
if (!globalStore.__seasons_analytics) {
    globalStore.__seasons_analytics = {
        activeVisitors: new Map(),
        recentPageViews: [],
    };
}
const mem = globalStore.__seasons_analytics;

function detectDevice(ua: string | null): 'mobile' | 'tablet' | 'desktop' {
    if (!ua) return 'desktop';
    const lower = ua.toLowerCase();
    if (/ipad|tablet|playbook|silk/i.test(lower)) return 'tablet';
    if (/mobile|iphone|android|ipod|blackberry|opera mini|iemobile/i.test(lower)) return 'mobile';
    return 'desktop';
}

export async function POST(req: NextRequest) {
    try {
        let body: { sessionId?: string; path?: string; referrer?: string };
        try {
            body = await req.json();
        } catch {
            return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
        }

        const { sessionId, path, referrer } = body;
        if (!sessionId || !path) {
            return NextResponse.json({ error: 'sessionId and path are required' }, { status: 400 });
        }

        const ua = req.headers.get('user-agent');
        const deviceType = detectDevice(ua);
        const now = Date.now();

        // 1. Update in-memory visitor store
        mem.activeVisitors.set(sessionId, {
            sessionId,
            path,
            deviceType,
            lastPing: now,
        });

        // Clean up inactive visitors older than 5 minutes
        for (const [id, visitor] of mem.activeVisitors.entries()) {
            if (now - visitor.lastPing > 5 * 60 * 1000) {
                mem.activeVisitors.delete(id);
            }
        }

        // Add to recent page views
        mem.recentPageViews.push({
            sessionId,
            path,
            deviceType,
            referrer: referrer || '',
            timestamp: now,
        });

        // Limit memory array size
        if (mem.recentPageViews.length > 5000) {
            mem.recentPageViews = mem.recentPageViews.slice(-2000);
        }

        // 2. Persist asynchronously to Supabase (best-effort)
        try {
            await Promise.allSettled([
                supabaseAdmin.from('active_visitors').upsert({
                    session_id: sessionId,
                    last_path: path,
                    device_type: deviceType,
                    last_ping: new Date().toISOString(),
                }),
                supabaseAdmin.from('page_views').insert({
                    session_id: sessionId,
                    path,
                    device_type: deviceType,
                    referrer: referrer || null,
                    user_agent: ua ? ua.slice(0, 250) : null,
                    created_at: new Date().toISOString(),
                }),
            ]);
        } catch {
            // Ignore DB log error to not block client ping
        }

        return NextResponse.json({
            success: true,
            activeOnlineUsers: mem.activeVisitors.size,
        });
    } catch (err) {
        console.error('Error in analytics ping API:', err);
        return NextResponse.json({ error: 'Failed to process ping' }, { status: 500 });
    }
}
