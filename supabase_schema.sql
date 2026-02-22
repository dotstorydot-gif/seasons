-- Enable UUID extension if not present
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- 1. Create categories table
CREATE TABLE IF NOT EXISTS public.categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_en TEXT NOT NULL,
    name_ar TEXT NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    image_url TEXT,
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
    items JSONB NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);
-- 4. Initial seed data for categories
INSERT INTO public.categories (name_en, name_ar, slug, image_url)
VALUES (
        'Seating',
        'كراسي',
        'seating',
        'https://images.unsplash.com/photo-1592078615290-033ee584e267?auto=format&fit=crop&q=80'
    ),
    (
        'Tables',
        'طاولات',
        'tables',
        'https://images.unsplash.com/photo-1530018607912-eff2df114f11?auto=format&fit=crop&q=80'
    ),
    (
        'Lighting',
        'إضاءة',
        'lighting',
        'https://images.unsplash.com/photo-1507473885765-e6ed657db981?auto=format&fit=crop&q=80'
    ),
    (
        'Decor',
        'ديكور',
        'decor',
        'https://images.unsplash.com/photo-1583847268964-b28dc2f51ac9?auto=format&fit=crop&q=80'
    ) ON CONFLICT (slug) DO NOTHING;
-- 5. Initial seed data for products
INSERT INTO public.products (
        category_id,
        name_en,
        name_ar,
        description_en,
        description_ar,
        price,
        sku,
        stock,
        images,
        is_featured
    )
VALUES (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'seating'
            LIMIT 1
        ), 'Serene Lounge Chair', 'كرسي استرخاء هادئ', 'A minimalist piece designed for ultimate comfort.', 'قطعة بسيطة مصممة لتوفير أقصى درجات الراحة.', 4500, 'SL-001', 12, '{"https://images.unsplash.com/photo-1592078615290-033ee584e267?auto=format&fit=crop&q=80"}', true
    ),
    (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'tables'
            LIMIT 1
        ), 'Oak Coffee Table', 'طاولة قهوة خشبية', 'Solid oak coffee table with a natural finish.', 'طاولة قهوة من خشب البلوط الصلب مع لمسة نهائية طبيعية.', 3200, 'CT-012', 8, '{"https://images.unsplash.com/photo-1530018607912-eff2df114f11?auto=format&fit=crop&q=80"}', true
    ),
    (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'lighting'
            LIMIT 1
        ), 'Minimalist Floor Lamp', 'مصباح أرضي عصري', 'Warm ambient lighting for your living room.', 'إضاءة محيطة دافئة لغرفة المعيشة الخاصة بك.', 1800, 'FL-005', 24, '{"https://images.unsplash.com/photo-1507473885765-e6ed657db981?auto=format&fit=crop&q=80"}', false
    ) ON CONFLICT (sku) DO NOTHING;