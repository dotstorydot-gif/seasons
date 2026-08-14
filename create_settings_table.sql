-- SQL Migration for Store Settings & Shipping Rules
CREATE TABLE IF NOT EXISTS public.settings (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    store_name TEXT DEFAULT 'Seasons',
    contact_email TEXT DEFAULT 'contact@seasons.com',
    whatsapp_number TEXT DEFAULT '+201234567890',
    shipping_fee NUMERIC DEFAULT 75,
    free_shipping_threshold NUMERIC DEFAULT 0,
    currency TEXT DEFAULT 'EGP',
    tax_percentage NUMERIC DEFAULT 0,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Safely add any missing columns if the table already existed previously
ALTER TABLE public.settings ADD COLUMN IF NOT EXISTS free_shipping_threshold NUMERIC DEFAULT 0;
ALTER TABLE public.settings ADD COLUMN IF NOT EXISTS shipping_fee NUMERIC DEFAULT 75;
ALTER TABLE public.settings ADD COLUMN IF NOT EXISTS tax_percentage NUMERIC DEFAULT 0;
ALTER TABLE public.settings ADD COLUMN IF NOT EXISTS whatsapp_number TEXT DEFAULT '+201234567890';
ALTER TABLE public.settings ADD COLUMN IF NOT EXISTS contact_email TEXT DEFAULT 'contact@seasons.com';
ALTER TABLE public.settings ADD COLUMN IF NOT EXISTS store_name TEXT DEFAULT 'Seasons';
ALTER TABLE public.settings ADD COLUMN IF NOT EXISTS currency TEXT DEFAULT 'EGP';

-- Enable RLS safely
ALTER TABLE public.settings ENABLE ROW LEVEL SECURITY;

-- Allow public read access for checkout and storefront
DROP POLICY IF EXISTS "Allow public select settings" ON public.settings;
DROP POLICY IF EXISTS "Allow service role all settings" ON public.settings;

CREATE POLICY "Allow public select settings" ON public.settings FOR SELECT USING (true);
CREATE POLICY "Allow service role all settings" ON public.settings FOR ALL USING (true);

-- Insert or update default settings record safely
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM public.settings) THEN
        INSERT INTO public.settings (store_name, contact_email, whatsapp_number, shipping_fee, free_shipping_threshold, currency, tax_percentage)
        VALUES ('Seasons', 'contact@seasons.com', '+201234567890', 75, 0, 'EGP', 0);
    ELSE
        UPDATE public.settings 
        SET shipping_fee = COALESCE(shipping_fee, 75),
            free_shipping_threshold = COALESCE(free_shipping_threshold, 0);
    END IF;
END $$;
