-- Update Category Images to local assets
UPDATE categories
SET image_url = '/images/categories/seasons.jpg'
WHERE name_en ILIKE '%season%';
UPDATE categories
SET image_url = '/images/categories/boards.jpg'
WHERE name_en ILIKE '%board%';
UPDATE categories
SET image_url = '/images/categories/trays.png'
WHERE name_en ILIKE '%tray%';
UPDATE categories
SET image_url = '/images/categories/serving.png'
WHERE name_en ILIKE '%serving%';
-- Verify
SELECT name_en,
    image_url
FROM categories;