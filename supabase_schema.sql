-- Enable UUID extension if not present
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- 1. Create categories table
CREATE TABLE IF NOT EXISTS public.categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_en TEXT NOT NULL,
    name_ar TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    image_url TEXT,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now()
);
-- 2. Create products table
CREATE TABLE IF NOT EXISTS public.products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id UUID REFERENCES public.categories(id) ON DELETE
    SET NULL,
        name_en TEXT NOT NULL,
        name_ar TEXT NOT NULL,
        description_en TEXT,
        description_ar TEXT,
        price NUMERIC NOT NULL,
        sku TEXT UNIQUE NOT NULL,
        stock INTEGER DEFAULT 0,
        images TEXT [] DEFAULT '{}',
        is_featured BOOLEAN DEFAULT false,
        size_en TEXT,
        size_ar TEXT,
        tags TEXT [] DEFAULT '{}',
        created_at TIMESTAMPTZ DEFAULT now()
);
-- 3. Create orders table
CREATE TABLE IF NOT EXISTS public.orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_number TEXT UNIQUE NOT NULL,
    full_name TEXT NOT NULL,
    phone TEXT NOT NULL,
    alt_phone TEXT,
    city TEXT NOT NULL,
    area TEXT NOT NULL,
    address TEXT NOT NULL,
    delivery_notes TEXT,
    total_amount NUMERIC NOT NULL,
    status TEXT DEFAULT 'pending',
    coupon_code TEXT,
    discount_amount NUMERIC DEFAULT 0,
    items JSONB NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);
-- 4. Create coupons table
CREATE TABLE IF NOT EXISTS public.coupons (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code TEXT UNIQUE NOT NULL,
    discount_type TEXT NOT NULL CHECK (discount_type IN ('percentage', 'free_delivery')),
    discount_value NUMERIC NOT NULL DEFAULT 0,
    max_uses INTEGER,
    per_user_limit INTEGER DEFAULT 1,
    expires_at TIMESTAMPTZ,
    is_active BOOLEAN DEFAULT true,
    used_count INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now()
);
-- 5. Create coupon_usages table
CREATE TABLE IF NOT EXISTS public.coupon_usages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    coupon_id UUID REFERENCES public.coupons(id) ON DELETE CASCADE,
    order_id UUID REFERENCES public.orders(id) ON DELETE CASCADE,
    user_phone TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);
-- 6. Row Level Security (RLS) Policies
-- These allow visitors to place orders and check coupons without a login.

-- Orders policies
ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow anonymous orders" ON public.orders FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow anonymous order lookup" ON public.orders FOR SELECT USING (true);

-- Coupons policies
ALTER TABLE public.coupons ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public lookup of active coupons" ON public.coupons FOR SELECT USING (is_active = true);

-- Coupon Usage policies
ALTER TABLE public.coupon_usages ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Allow public coupon tracking" ON public.coupon_usages FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public usage check" ON public.coupon_usages FOR SELECT USING (true);
