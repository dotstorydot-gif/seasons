-- ============================================
-- Update Category Images, Arabic Names & Order
-- Run in: https://supabase.com/dashboard/project/itbgqzgummdfcrzsydmc/sql/new
-- ============================================
-- Step 1: Add sort_order column if it doesn't exist
ALTER TABLE categories
ADD COLUMN IF NOT EXISTS sort_order INT DEFAULT 99;
-- Step 2: Update each category individually (no syntax errors)
UPDATE categories
SET image_url = 'https://itbgqzgummdfcrzsydmc.supabase.co/storage/v1/object/public/categories/seasons.png',
    name_ar = 'إصدارات المواسم',
    sort_order = 1
WHERE name_en ILIKE '%season%';
UPDATE categories
SET image_url = 'https://itbgqzgummdfcrzsydmc.supabase.co/storage/v1/object/public/categories/boards.png',
    name_ar = 'ألواح تقديم',
    sort_order = 2
WHERE name_en ILIKE '%board%';
UPDATE categories
SET image_url = 'https://itbgqzgummdfcrzsydmc.supabase.co/storage/v1/object/public/categories/trays.png',
    name_ar = 'صواني',
    sort_order = 3
WHERE name_en ILIKE '%tray%';
UPDATE categories
SET image_url = 'https://itbgqzgummdfcrzsydmc.supabase.co/storage/v1/object/public/categories/serving.png',
    name_ar = 'أدوات تقديم',
    sort_order = 4
WHERE name_en ILIKE '%serving%';
-- Step 3: Verify
SELECT sort_order,
    name_en,
    name_ar,
    image_url
FROM categories
ORDER BY sort_order;