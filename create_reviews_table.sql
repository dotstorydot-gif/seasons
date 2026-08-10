-- Create reviews table in Supabase
CREATE TABLE IF NOT EXISTS public.reviews (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT NOT NULL,
    quality INT NOT NULL DEFAULT 0,
    durability INT NOT NULL DEFAULT 0,
    shape INT NOT NULL DEFAULT 0,
    packaging INT NOT NULL DEFAULT 0,
    delivery_time INT NOT NULL DEFAULT 0,
    delivery_speed INT NOT NULL DEFAULT 0,
    shipping_company INT NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE public.reviews ENABLE ROW LEVEL SECURITY;

-- Allow service_role to read and insert (bypasses RLS by default)
-- Allow public anon to insert reviews if desired
CREATE POLICY "Allow public review insertion" ON public.reviews 
    FOR INSERT WITH CHECK (true);
