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
    items JSONB NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);
-- 4. Initial seed data for categories
-- First, clear existing categories to avoid duplicates and remove unwanted ones
DELETE FROM public.categories;

INSERT INTO public.categories (name_en, name_ar, slug, image_url, sort_order)
VALUES (
        'Seasons Specials',
        'عروض سيزونز',
        'specials',
        '/images/categories/seasons.jpg',
        1
    ),
    (
        'Boards',
        'ألواح تقديم',
        'boards',
        '/images/categories/boards.jpg',
        2
    ),
    (
        'Trays',
        'صواني',
        'trays',
        '/images/categories/trays.png',
        3
    ),
    (
        'Serving',
        'أدوات تقديم',
        'serving',
        '/images/categories/serving.png',
        4
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
            WHERE slug = 'specials'
            LIMIT 1
        ), 'Ramadan Moon Plate', 'طبق الهلال لرمضان', 'Beautiful crescent moon shaped wooden tray for nuts and dates.', 'صينية خشبية على شكل هلال جميلة للمكسرات والتمر.', 610, 'RS-001', 25, '{"/images/categories/seasons.jpg"}', true
    ),
    (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Oak Serving Board', 'لوح تقديم خشب البلوط', 'Premium solid oak board for charcuterie and appetizers.', 'لوح من خشب البلوط الصلب الممتاز للمقبلات.', 450, 'BD-012', 15, '{"/images/categories/boards.jpg"}', true
    ),
    (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Handcrafted Sushi Tray', 'صينية سوشي مصنوعة يدوياً', 'Elegant wooden tray designed specifically for serving sushi.', 'صينية خشبية أنيقة مصممة خصيصاً لتقديم السوشي.', 380, 'TR-005', 30, '{"/images/categories/trays.png"}', false
    ),
    (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Wooden Glass Stand', 'قاعدة تقديم خشبية للزجاج', 'A sturdy wooden base to elevate your glass serving dishes.', 'قاعدة خشبية متينة لرفع أطباق التقديم الزجاجية.', 290, 'SV-008', 20, '{"/images/categories/serving.png"}', false
    ) ON CONFLICT (sku) DO NOTHING;