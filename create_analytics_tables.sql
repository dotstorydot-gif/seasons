-- SQL Migration for Traffic & Real-Time Analytics
CREATE TABLE IF NOT EXISTS public.page_views (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id TEXT NOT NULL,
    path TEXT NOT NULL,
    user_agent TEXT,
    device_type TEXT DEFAULT 'desktop',
    referrer TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.active_visitors (
    session_id TEXT PRIMARY KEY,
    last_path TEXT NOT NULL,
    device_type TEXT DEFAULT 'desktop',
    last_ping TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indices for rapid real-time traffic queries
CREATE INDEX IF NOT EXISTS idx_page_views_created_at ON public.page_views(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_active_visitors_last_ping ON public.active_visitors(last_ping DESC);

-- Enable RLS policies safely
ALTER TABLE public.page_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.active_visitors ENABLE ROW LEVEL SECURITY;

-- Allow public insert/ping, allow admin read
CREATE POLICY "Allow public insert page_views" ON public.page_views FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public insert active_visitors" ON public.active_visitors FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update active_visitors" ON public.active_visitors FOR UPDATE USING (true);
CREATE POLICY "Allow service role all page_views" ON public.page_views FOR ALL USING (true);
CREATE POLICY "Allow service role all active_visitors" ON public.active_visitors FOR ALL USING (true);
