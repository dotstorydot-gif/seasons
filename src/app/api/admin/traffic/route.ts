import { NextRequest, NextResponse } from 'next/server';
import { checkAdminSecret } from '@/lib/adminAuth';
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

const globalStore = globalThis as unknown as { __seasons_analytics?: GlobalAnalyticsMemory };

export async function GET(req: NextRequest) {
    const authError = checkAdminSecret(req);
    if (authError) return authError;

    const now = Date.now();
    const mem = globalStore.__seasons_analytics;

    // 1. Calculate active online users from memory (pings within 5 minutes)
    const activeVisitorsList: Array<{ sessionId: string; path: string; deviceType: string; minutesAgo: number }> = [];
    if (mem?.activeVisitors) {
        for (const [id, v] of mem.activeVisitors.entries()) {
            const diffMs = now - v.lastPing;
            if (diffMs <= 5 * 60 * 1000) {
                activeVisitorsList.push({
                    sessionId: id.substring(0, 14) + '...',
                    path: v.path,
                    deviceType: v.deviceType,
                    minutesAgo: Math.round(diffMs / 1000 / 60),
                });
            } else {
                mem.activeVisitors.delete(id);
            }
        }
    }

    // 2. Fetch page views from database with fallback to in-memory store
    let pageViewsData: Array<{ path: string; device_type?: string; created_at: string; session_id: string }> = [];

    try {
        const { data: dbViews } = await supabaseAdmin
            .from('page_views')
            .select('path, device_type, created_at, session_id')
            .order('created_at', { ascending: false })
            .limit(2000);

        if (dbViews && dbViews.length > 0) {
            pageViewsData = dbViews;
        }
    } catch {
        // Fallback to memory
    }

    // If DB has no views yet, use in-memory views
    if (pageViewsData.length === 0 && mem?.recentPageViews) {
        pageViewsData = mem.recentPageViews.map((pv) => ({
            path: pv.path,
            device_type: pv.deviceType,
            created_at: new Date(pv.timestamp).toISOString(),
            session_id: pv.sessionId,
        }));
    }

    // 3. Compute Traffic Statistics
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const todayMs = today.getTime();

    let todayViewsCount = 0;
    const uniqueSessions = new Set<string>();
    const pageCounts: Record<string, number> = {};
    const deviceCounts: Record<string, number> = { desktop: 0, mobile: 0, tablet: 0 };
    const hourlyDistribution: Record<string, number> = {};

    // Initialize 24-hour distribution slots
    for (let i = 0; i < 24; i++) {
        const hourStr = `${i.toString().padStart(2, '0')}:00`;
        hourlyDistribution[hourStr] = 0;
    }

    pageViewsData.forEach((pv) => {
        const pvDate = new Date(pv.created_at);
        const pvMs = pvDate.getTime();

        if (pv.session_id) uniqueSessions.add(pv.session_id);

        if (pvMs >= todayMs) {
            todayViewsCount++;
            const hourKey = `${pvDate.getHours().toString().padStart(2, '0')}:00`;
            hourlyDistribution[hourKey] = (hourlyDistribution[hourKey] || 0) + 1;
        }

        // Top pages
        const cleanPath = pv.path || '/';
        pageCounts[cleanPath] = (pageCounts[cleanPath] || 0) + 1;

        // Devices
        const dev = pv.device_type || 'desktop';
        deviceCounts[dev] = (deviceCounts[dev] || 0) + 1;
    });

    const topPages = Object.entries(pageCounts)
        .map(([path, views]) => ({ path, views }))
        .sort((a, b) => b.views - a.views)
        .slice(0, 10);

    return NextResponse.json({
        onlineNow: activeVisitorsList.length,
        activeVisitors: activeVisitorsList,
        todayViews: todayViewsCount,
        totalViews: pageViewsData.length,
        uniqueSessions: uniqueSessions.size,
        topPages,
        devices: deviceCounts,
        hourlyDistribution,
    });
}
