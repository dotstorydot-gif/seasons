-- Final Product Catalog Sync
-- Generated on 2026-04-28T06:22:40.073Z

BEGIN;

-- 1. Insert or update products
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '005',
  'Bowls',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/005-Easter holder - 8 eggs/005-Easter-holder---8-eggs-01.webp','/images/1-seasons special/005-Easter holder - 8 eggs/005-Easter-holder---8-eggs-02.webp','/images/1-seasons special/005-Easter holder - 8 eggs/005-Easter-holder---8-eggs-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '017',
  'circle coaster',
  'كوستر دائري',
  'Round cup holder',
  'حامل اكواب بشكل دائري',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  200,
  0,
  '',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','coasters'']::TEXT[']::TEXT[],
  ARRAY['/images/1-seasons special/017-Circle coaster/017-Circle-coaster-01.webp','/images/1-seasons special/017-Circle coaster/017-Circle-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '018',
  'coffee coaster',
  'كوستر للقهوه',
  'Coffee cup holder',
  'حامل اكواب للقهوه',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  300,
  0,
  '',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','coasters','tray'']::TEXT[']::TEXT[],
  ARRAY['/images/1-seasons special/018-Coffee coaster/018-Coffee-coaster-01.webp','/images/1-seasons special/018-Coffee coaster/018-Coffee-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '019B',
  'Large Cheese Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/019B-Large Cheese Board/019B-Large Cheese Board-01.webp','/images/3-trays/019B-Large Cheese Board/019B-Large Cheese Board-02.webp','/images/3-trays/019B-Large Cheese Board/019B-Large Cheese Board-03.jpg']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '044',
  'Cutting Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/044-Large Cutting board/044-Large Cutting board-01.webp','/images/2-Boards/044-Large Cutting board/044-Large Cutting board-02.webp','/images/2-Boards/044-Large Cutting board/044-Large Cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '045',
  'Cutting Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/045-Cutting board/045-Cutting board-01.webp','/images/2-Boards/045-Cutting board/045-Cutting board-02.webp','/images/2-Boards/045-Cutting board/045-Cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '046',
  'Stripe Cutting Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/046-Stripe cutting board/046-Stripe cutting board-01.webp','/images/2-Boards/046-Stripe cutting board/046-Stripe cutting board-02.webp','/images/2-Boards/046-Stripe cutting board/046-Stripe cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '047',
  'Round Cutting Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/047-Round cutting board/047-Round cutting board-01.webp','/images/2-Boards/047-Round cutting board/047-Round cutting board-02.webp','/images/2-Boards/047-Round cutting board/047-Round cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '048',
  'Mini Round Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/048-Mini Round board/048-Mini Round board-01.webp','/images/2-Boards/048-Mini Round board/048-Mini Round board-02.webp','/images/2-Boards/048-Mini Round board/048-Mini Round board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '049',
  'Round Sheesham Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/049-Round sheesham board/049-Round sheesham board-01.webp','/images/2-Boards/049-Round sheesham board/049-Round sheesham board-02.webp','/images/2-Boards/049-Round sheesham board/049-Round sheesham board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '050',
  'Large Kaia Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/050-Kaia large plate/050-Kaia-large-plate-01.webp','/images/4-serving/050-Kaia large plate/050-Kaia-large-plate-02.webp','/images/4-serving/050-Kaia large plate/050-Kaia-large-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '051-01',
  'Set of 2-Mini plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/051-01-Set of Mini plates/051-01-Set of Mini plates-01.webp','/images/4-serving/051-01-Set of Mini plates/051-01-Set of Mini plates-02.webp','/images/4-serving/051-01-Set of Mini plates/051-01-Set of Mini plates-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '051-02',
  'Mini Plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/051-02-Small Mini plate /051-02-Small Mini plate-01.webp','/images/4-serving/051-02-Small Mini plate /051-02-Small Mini plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '051-03',
  'Mini plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/051-03-Medium Mini plate/051-03-Medium Mini plate-01.webp','/images/4-serving/051-03-Medium Mini plate/051-03-Medium Mini plate-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '052',
  'Small Heart',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/052-Small-Heart-Plate/052-Small-Heart-Plate-01.webp','/images/4-serving/052-Small-Heart-Plate/052-Small-Heart-Plate-02.webp','/images/4-serving/052-Small-Heart-Plate/052-Small-Heart-Plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '053',
  'Big Heart',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/053-Big Heart/053-Big Heart-01.webp','/images/4-serving/053-Big Heart/053-Big Heart-02.webp','/images/4-serving/053-Big Heart/053-Big Heart-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '054-01',
  'Set of pizza serving plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-01png.webp','/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-02.webp','/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '054-02',
  'Small Pizza Serving Plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '054-03',
  'Meduim pizza serving plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '054-04',
  'Large Pizza Serving plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-01png.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '055',
  'Ramadan napkin holder',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/055-Ramadan napkin holder/Ramadan-napkin-holder-01.webp','/images/1-seasons special/055-Ramadan napkin holder/Ramadan-napkin-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '056',
  'Crescent Decoration',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/056-Crescent decoration/Crescent decoration-01.webp','/images/1-seasons special/056-Crescent decoration/Crescent decoration-02.jpg']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '057',
  'Crescent plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/057-Crescent plate/Crescent plate-01.webp','/images/1-seasons special/057-Crescent plate/Crescent plate-02.webp','/images/1-seasons special/057-Crescent plate/Crescent plate-03.jpg']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '058',
  'Ramadan Mosque Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/058-Ramadan Mosque Plate/Ramadan Mosque Plate-01.webp','/images/1-seasons special/058-Ramadan Mosque Plate/Ramadan Mosque Plate-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '059',
  'Lantern Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/059-Lantern plate/059-Lantern plat-01.webp','/images/1-seasons special/059-Lantern plate/059-Lantern plat-02.webp','/images/1-seasons special/059-Lantern plate/059-Lantern plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '060-01',
  'Set of 3-Star serving plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/060-01-Set of Star serving plate/Set of Star serving plate-01.webp','/images/1-seasons special/060-01-Set of Star serving plate/Set of Star serving plate-02.webp','/images/1-seasons special/060-01-Set of Star serving plate/Set of Star serving plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '060-02',
  'Small Star Serving Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/060-02-Small Star serving plate/Small Star serving plate-01.webp','/images/1-seasons special/060-02-Small Star serving plate/Small Star serving plate-02.jpg']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '060-03',
  'Medium Star Serving Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/060-03-Meduim Star serving plate/Medium-Star-serving-plate-01.webp','/images/1-seasons special/060-03-Meduim Star serving plate/Medium-Star-serving-plate-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '060-04',
  'Large Star Serving Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/060-04-Large Star serving plate/Large Star serving plate-01.webp','/images/1-seasons special/060-04-Large Star serving plate/Large Star serving plate-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '061',
  'Star & Crescent Serving Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/061-Star serving plate/Star serving plate-01.webp','/images/1-seasons special/061-Star serving plate/Star serving plate-02.webp','/images/1-seasons special/061-Star serving plate/Star serving plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '062',
  'Serving Set',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/062-Serving Set/062-Serving Set-01.webp','/images/4-serving/062-Serving Set/062-Serving Set-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '063',
  'Moon Serving Stand (Wood) III',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/063-01-Set of Crescent Serving Stand, light brown/063-01-Set-of-Crescent-Serving-Stand,-light-brown-01.webp','/images/1-seasons special/063-01-Set of Crescent Serving Stand, light brown/063-01-Set-of-Crescent-Serving-Stand,-light-brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '063-01',
  'Set of 2-Crescent Serving Stand, light brown',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/063-01-Set of Crescent Serving Stand, light brown/063-01-Set-of-Crescent-Serving-Stand,-light-brown-01.webp','/images/1-seasons special/063-01-Set of Crescent Serving Stand, light brown/063-01-Set-of-Crescent-Serving-Stand,-light-brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '063-02',
  'Small Crescent Serving Stand',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/063-02-Crescent Serving Stand, light brown-small/063-02-Set-of-Crescent-Serving-Stand,-light-brow-small-01.webp','/images/1-seasons special/063-02-Crescent Serving Stand, light brown-small/063-02-Set-of-Crescent-Serving-Stand,-light-brow-small-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '063-03',
  'Large Crescent Serving Stand',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/063-03-Crescent Serving Stand, light brown-large/063-02-Set-of-Crescent-Serving-Stand,-light-brow-large-01.webp','/images/1-seasons special/063-03-Crescent Serving Stand, light brown-large/063-02-Set-of-Crescent-Serving-Stand,-light-brow-large-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '064',
  'Moon Serving Stand (Wood) IV',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/064-01-Set of Crescent Serving Stand, dark brown/064-01-Set of Crescent Serving Stand, dark brown-01.webp','/images/1-seasons special/064-01-Set of Crescent Serving Stand, dark brown/064-02-Set of Crescent Serving Stand, dark brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '064-01',
  'Set of 2-Crescent Serving Stand, dark brown',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/064-01-Set of Crescent Serving Stand, dark brown/064-01-Set of Crescent Serving Stand, dark brown-01.webp','/images/1-seasons special/064-01-Set of Crescent Serving Stand, dark brown/064-02-Set of Crescent Serving Stand, dark brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '064-02',
  'Small Crescent Serving Stand',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/064-02-small of Crescent Serving Stand, dark brown/064-02-Small Crescent Serving Stand, dark brown-01.webp','/images/1-seasons special/064-02-small of Crescent Serving Stand, dark brown/064-02-Small Crescent Serving Stand, dark brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '064-03',
  'Large Crescent Serving Stand',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/064-03-Large of Crescent Serving Stand, dark brown/064-03-Large of Crescent Serving Stand, dark brown-01.webp','/images/1-seasons special/064-03-Large of Crescent Serving Stand, dark brown/064-03-Large of Crescent Serving Stand, dark brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '065',
  'Kitchen magnet',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/065-Kitchen Magnet/065-Kitchen Magnet-01.webp','/images/4-serving/065-Kitchen Magnet/065-Kitchen Magnet-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '066',
  'Welcome magnet',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/066-Welcome magnet/066-Welcome magnet-01.webp','/images/4-serving/066-Welcome magnet/066-Welcome magnet-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '067',
  'Cutlery Set Magnet',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/067-Cutlery Set Magnet/067-Cutlery Set Magnet-01.webp','/images/4-serving/067-Cutlery Set Magnet/067-Cutlery Set Magnet-02.jpg','/images/4-serving/067-Cutlery Set Magnet/067-Cutlery Set Magnet-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '068',
  'Desposable cutlery',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY[]::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '069',
  'Pizza Set',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/069-Pizza Set/069-Pizza Set-01.webp','/images/4-serving/069-Pizza Set/069-Pizza Set-02.webp','/images/4-serving/069-Pizza Set/069-Pizza Set-03.webp','/images/4-serving/069-Pizza Set/069-Pizza Set-04.webp','/images/4-serving/069-Pizza Set/069-Pizza Set-05.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '070',
  'Kitchen tissue holder',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/070-Kitchen-Tissue/070-Kitchen-tissue-holder-01.webp','/images/4-serving/070-Kitchen-Tissue/070-Kitchen-tissue-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '071',
  'Toilet tissue holder',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/071-Toilet tissue holder/071-Toilet-tissue-holder-01.webp','/images/4-serving/071-Toilet tissue holder/071-Toilet-tissue-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '072',
  'Large Coaster with Candle',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/072-Large Coaster with Candle/075-Large Coaster with Candle-01.webp','/images/4-serving/072-Large Coaster with Candle/075-Large Coaster with Candle-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '073',
  'Medium Coaster with Candle',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY[]::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '074',
  'Small Coaster with Candle',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/074-Small Coaster with Candle/074-Small Coaster with Candle-01.webp','/images/4-serving/074-Small Coaster with Candle/074-Small Coaster with Candle-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '075',
  'Oval Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/075-Oval Plate/075-Oval-Plate-01.webp','/images/4-serving/075-Oval Plate/075-Oval-Plate-02.webp','/images/4-serving/075-Oval Plate/075-Oval-Plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '076',
  'Square Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/076-Square-Plate/076-Square-Plate-01.webp','/images/4-serving/076-Square-Plate/076-Square-Plate-02.webp','/images/4-serving/076-Square-Plate/076-Square-Plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '077',
  'Oval Deep Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/077-Oval Deep Plate /077-Oval-Deep-Plate-01.webp','/images/4-serving/077-Oval Deep Plate /077-Oval-Deep-Plate-02.webp','/images/4-serving/077-Oval Deep Plate /077-Oval-Deep-Plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '078',
  'Oval Deep Plate with legs',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/078-Oval Deep Plate with legs/078-Oval-Deep-Plate-with-legs-01.webp','/images/4-serving/078-Oval Deep Plate with legs/078-Oval-Deep-Plate-with-legs-02.webp','/images/4-serving/078-Oval Deep Plate with legs/078-Oval-Deep-Plate-with-legs-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '079',
  'Fish Napkin',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/079-Fish-Napkin/079-Fish-Napking-01.webp','/images/4-serving/079-Fish-Napkin/079-Fish-Napking-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '080',
  'Oval Dipping Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/080-Oval dipping plate/080-Oval-dipping-plate-01.webp','/images/4-serving/080-Oval dipping plate/080-Oval-dipping-plate-02.webp','/images/4-serving/080-Oval dipping plate/080-Oval-dipping-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '081',
  'Mini oval dipping plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/081-Mini oval dipping plate/081-Mini-oval-dipping-plate-01.webp','/images/4-serving/081-Mini oval dipping plate/081-Mini-oval-dipping-plate-02.webp','/images/4-serving/081-Mini oval dipping plate/081-Mini-oval-dipping-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '082-01',
  'Set of 2-wood food warmer',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-01.webp','/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-02.webp','/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-03.webp','/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-04.webp','/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-05.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '082-02',
  'Large Wood Food Warmer',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/082-02-Large-Food-Warmer/082-02-Large-Food-Warmer-01.webp','/images/4-serving/082-02-Large-Food-Warmer/082-03-Large-Food-Warmer-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '082-03',
  'Small Wood Food Warmer',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/082-03-Small-Food-Warmer/082-02-Small-Food-Warmer-01.webp','/images/4-serving/082-03-Small-Food-Warmer/082-02-Small-Food-Warmer-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '083-01',
  'Set of 3-Rectangle Plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/083-01-set-of-rectangle-plates/083-01-set-of-rectangle-plates-01.webp','/images/4-serving/083-01-set-of-rectangle-plates/083-01-set-of-rectangle-plates-02.webp','/images/4-serving/083-01-set-of-rectangle-plates/083-01-set-of-rectangle-plates-03.webp','/images/4-serving/083-01-set-of-rectangle-plates/083-01-set-of-rectangle-plates-04.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '083-02',
  'Small Rectangle Plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/083-02-Small-rectangle-plates/083-01-set-of-rectangle-plates-01.webp','/images/4-serving/083-02-Small-rectangle-plates/083-01-set-of-rectangle-plates-02.webp','/images/4-serving/083-02-Small-rectangle-plates/083-01-set-of-rectangle-plates-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '083-03',
  'Meduim Rectangle Plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY[]::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '083-04',
  'Large Rectangle Plates',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY[]::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '084',
  'Sheesham Plate',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/084-sheesham wooden plate/084-sheesham-wooden-plate-01.webp','/images/4-serving/084-sheesham wooden plate/084-sheesham-wooden-plate-02.webp','/images/4-serving/084-sheesham wooden plate/084-sheesham-wooden-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '085',
  'X-Large Bowl',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/085-XLarge-Bowl/085-XL-Bowl-01.webp','/images/4-serving/085-XLarge-Bowl/085-XL-Bowl-02.webp','/images/4-serving/085-XLarge-Bowl/085-XL-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '086',
  'Large Bowl',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/086-Large-Bowl/086-Large-Bowl-01.webp','/images/4-serving/086-Large-Bowl/086-Large-Bowl-02.webp','/images/4-serving/086-Large-Bowl/086-Large-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '087',
  'Meduim Bowl',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/087-Medium-Bowl/087-Medium-Bowl-01.webp','/images/4-serving/087-Medium-Bowl/087-Medium-Bowl-02.webp','/images/4-serving/087-Medium-Bowl/87-Medium-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '088',
  'Small Bowl',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/088-Small-Bowl/088-Small-Bowl-01.webp','/images/4-serving/088-Small-Bowl/088-Small-Bowl-02.webp','/images/4-serving/088-Small-Bowl/088-Small-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '089-01',
  'Set of 3-Deep Bowls',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/089-01-Set-Of-Deep-Bowls/089-01-Set-Of-Deep-Bowls-01.webp','/images/4-serving/089-01-Set-Of-Deep-Bowls/089-01-Set-Of-Deep-Bowls-02.webp','/images/4-serving/089-01-Set-Of-Deep-Bowls/089-01-Set-Of-Deep-Bowls-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '089-02',
  'Large Deep Bowl',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/089-02-Large-Deep-Bowl/089-02-large-Deep-Bowl-02.webp','/images/4-serving/089-02-Large-Deep-Bowl/089-02-large-Deep-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '089-03',
  'Meduim Deep Bowl',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/089-03-Medium-Deep-Bowl/089-03-Medium-Deep-Bowl-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '089-04',
  'Small Deep Bowl',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/089-04-Small-Deep-Bowl/089-04-Small-Deep-Bowl-02.webp','/images/4-serving/089-04-Small-Deep-Bowl/089-04-Small-Deep-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '090',
  'Meduim Bowl',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/090-Medium-Bowl/090-Medium-Bowl-01.webp','/images/4-serving/090-Medium-Bowl/090-Medium-Bowl-02.webp','/images/4-serving/090-Medium-Bowl/090-Medium-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '091',
  'Large Bowl',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/091-LargeBowl/091-Large-Bowl-01.webp','/images/4-serving/091-LargeBowl/091-Large-Bowl-02.webp','/images/4-serving/091-LargeBowl/091-Large-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '092',
  'The Grill',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/92-The Grill/092-The-Grill-01.webp','/images/3-trays/92-The Grill/092-The-Grill-02.webp','/images/3-trays/92-The Grill/092-The-Grill-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '093-01',
  'Set of 3-Wooden Tray with Wooden Handle',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/093-01-Set of wooden tray with wood handle/trayset-01.webp','/images/3-trays/093-01-Set of wooden tray with wood handle/trayset-02.webp','/images/3-trays/093-01-Set of wooden tray with wood handle/trayset-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '093-02',
  'Large Wooden Tray with Wooden Handle',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/093-02-Large of wooden tray with wood handle/093-02-Large of wooden tray with wood handle-01.webp','/images/3-trays/093-02-Large of wooden tray with wood handle/093-02-Large of wooden tray with wood handle-02.webp','/images/3-trays/093-02-Large of wooden tray with wood handle/093-02-Large of wooden tray with wood handle-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '093-03',
  'Medium Wooden Tray with Wooden Handle',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/093-03-Medium of wooden tray with wood handle /093-03-Medium of wooden tray with wood handle-01.webp','/images/3-trays/093-03-Medium of wooden tray with wood handle /093-03-Medium of wooden tray with wood handle-02.webp','/images/3-trays/093-03-Medium of wooden tray with wood handle /093-03-Medium of wooden tray with wood handle-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '093-04',
  'Small Wooden Tray with Wooden Handle',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/093-04-Small of wooden tray with wood handle/093-04-Small of wooden tray with wood handle-01.webp','/images/3-trays/093-04-Small of wooden tray with wood handle/093-04-Small of wooden tray with wood handle-02.webp','/images/3-trays/093-04-Small of wooden tray with wood handle/093-04-Small of wooden tray with wood handle-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '094',
  'Wooden Tray with Black Handle',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/094-Wooden tray with handle/094-Wooden tray with handl-01.webp','/images/3-trays/094-Wooden tray with handle/094-Wooden tray with handl-02.webp','/images/3-trays/094-Wooden tray with handle/094-Wooden tray with handl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '095-01',
  'Set of 2-Puzzle Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-01.webp','/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-02.webp','/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-03.webp','/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-04.webp','/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-05.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '095-02',
  'Small Puzzle Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/095-02-Small Puzzle Board /095-02-Small Puzzle Board-01.webp','/images/2-Boards/095-02-Small Puzzle Board /095-02-Small Puzzle Board-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '095-03',
  'Large Puzzle Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/095-03-Large Puzzle Board/095-03-Large Puzzle Board-01.webp','/images/2-Boards/095-03-Large Puzzle Board/095-03-Large Puzzle Board-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '096',
  'Sheesham cutting board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/096-Sheesham cutting board /096-Sheesham cutting board-01.webp','/images/2-Boards/096-Sheesham cutting board /096-Sheesham cutting board-02.webp','/images/2-Boards/096-Sheesham cutting board /096-Sheesham cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '097',
  'Sheesham Cutting Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/097- Small Sheesham cutting board/097-Small Sheesham-cutting-board-01.webp','/images/2-Boards/097- Small Sheesham cutting board/097-Small Sheesham-cutting-board-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '098',
  'Flat Cheese Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/098-Flat Cheese Board/098-Flat Cheese Board-01.webp','/images/3-trays/098-Flat Cheese Board/098-Flat Cheese Board-02.webp','/images/3-trays/098-Flat Cheese Board/098-Flat Cheese Board-03.jpg']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '099',
  'Deep Cheese Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/099-Deep Cheese Board/099-Deep Cheese Board-01.webp','/images/3-trays/099-Deep Cheese Board/099-Deep Cheese Board-02.webp','/images/3-trays/099-Deep Cheese Board/099-Deep Cheese Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '100-01',
  'Set of 2-Bloom Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/100-01-Set of Bloom Board/100-01-Set of Bloom Board-01.webp','/images/3-trays/100-01-Set of Bloom Board/100-01-Set of Bloom Board-02.webp','/images/3-trays/100-01-Set of Bloom Board/100-01-Set of Bloom Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '100-02',
  'Small Bloom Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/100-02-Small Bloom Board/100-02-Small-Bloom-Board-01.webp','/images/3-trays/100-02-Small Bloom Board/100-02-Small-Bloom-Board-02.webp','/images/3-trays/100-02-Small Bloom Board/100-02-Small-Bloom-Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '100-03',
  'Large Bloom Board',
  '',
  '',
  '',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  0,
  0,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/100-03-Large Bloom Board copy/100-03-Large-Bloom-Board-01.webp','/images/3-trays/100-03-Large Bloom Board copy/100-03-Large-Bloom-Board-02.webp','/images/3-trays/100-03-Large Bloom Board copy/100-03-Large-Bloom-Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '041',
  'Board with Ears',
  'لوح  بودان',
  'searving board with 2 cup place',
  'لوح تقديم يحتوي علي اماكن لحمل الاكواب',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  600,
  4,
  '46*42',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','glasses','movie nights','gathering'']::TEXT[']::TEXT[],
  ARRAY['/images/2-Boards/041-Board with Ears/041-Board-with-Ears-01.webp','/images/2-Boards/041-Board with Ears/041-Board-with-Ears-02.webp','/images/2-Boards/041-Board with Ears/041-Board with Ears-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '040',
  'Waves board',
  'لوح مموج',
  'serving board with multi-purposes, for cheese, for sushi or desserts',
  '',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  400,
  1,
  '',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','movie nights','gathering'']::TEXT[']::TEXT[],
  ARRAY['/images/4-serving/040-Waves board/040-Waves-Board-01.webp','/images/4-serving/040-Waves board/040-Waves-Board-02.webp','/images/4-serving/040-Waves board/040-Waves-Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '039',
  'Meduim Taco Holder',
  'حامل تاكو متوسط الحجم',
  'Medium-sized taco holder',
  'حامل للتاكو متوسط الحجم',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  260,
  1,
  '37*7.5',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','tacos'']::TEXT[']::TEXT[],
  ARRAY['/images/4-serving/039-Meduim Taco Holder/039-Meduim Taco Holder-01.webp','/images/4-serving/039-Meduim Taco Holder/039-Meduim-Taco-Holder-02.webp','/images/4-serving/039-Meduim Taco Holder/039-Meduim Taco Holder-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '038',
  'Small Taco Holder',
  'حامل تاكو صغير الحجم',
  'Mini taco holder',
  'حامل للتاكو صغير',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  180,
  4,
  '16*7.5',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','tacos'']::TEXT[']::TEXT[],
  ARRAY['/images/4-serving/038-Small Taco Holder/038-Small-Taco-Holder-01.webp','/images/4-serving/038-Small Taco Holder/038-Small-Taco-Holder-02.webp','/images/4-serving/038-Small Taco Holder/038-Small Taco Holder-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '036',
  'large Sushi tray',
  'صينيه سوشي كبيره',
  'large Sushi tray',
  'صينيه سوشي كبيره',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  1800,
  1,
  '68.5*14.5',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','sushi','gathering','tray'']::TEXT[']::TEXT[],
  ARRAY['/images/3-trays/036-large Sushi tray/036-large-Sushi-tray-01.webp','/images/3-trays/036-large Sushi tray/036-large-Sushi-tray-02.webp','/images/3-trays/036-large Sushi tray/036-large-Sushi-tray-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '035',
  'Disassembly and assembly board',
  'لوح فك وتركيب',
  'Disassembly and assembly board',
  'لوح فك وتركيب',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  900,
  3,
  '69.5*15*25',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','glasses','sushi','gathering','tray'']::TEXT[']::TEXT[],
  ARRAY['/images/3-trays/035-Disassembly and assembly board/035-Disassembly-and-assembly-board-01.webp','/images/3-trays/035-Disassembly and assembly board/035-Disassembly-and-assembly-board-02.webp','/images/3-trays/035-Disassembly and assembly board/035-Disassembly-and-assembly-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '034',
  'small Split serving board',
  'لوح تقديم مقسم صغير',
  'small divided snack serving tray',
  'لوح لتقديم التسالي مقسم صغير',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  450,
  0,
  '24.5*12',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','serving'']::TEXT[']::TEXT[],
  ARRAY['/images/4-serving/034-Small Split serving board/034-Small-Split-serving-board-01.webp','/images/4-serving/034-Small Split serving board/034-Small-Split-serving-board-02.webp','/images/4-serving/034-Small Split serving board/034-Small-Split-serving-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '033',
  'Large Star',
  'نجمه كبيره',
  'A large star-shaped dish',
  'طبق علي شكل نجمه كبير',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  400,
  1,
  'large',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','tableware','serving','beech pine','wood plate','serving plate','ramadan','special season','christmas','star','dipping'']::TEXT[']::TEXT[],
  ARRAY['/images/1-seasons special/033-Large-Star/033-Large-Star-01.webp','/images/1-seasons special/033-Large-Star/033-Large-Star-02.webp','/images/1-seasons special/033-Large-Star/033-Large-Star-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '032',
  'Small Star',
  'نجمه صغيره',
  'A small star-shaped dish',
  'طبق علي شكل نجمه صغيره',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  300,
  1,
  'small',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','tableware','serving','beech pine','wood plate','serving plate','ramadan','special season','christmas','star','dipping'']::TEXT[']::TEXT[],
  ARRAY['/images/1-seasons special/032-small-Star/032-small-Star-01.webp','/images/1-seasons special/032-small-Star/032-small-Star-02.webp','/images/1-seasons special/032-small-Star/032-small-Star-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '030',
  'Meduim Cutting board with handle',
  'لوح تقطيع متوسط ب يد',
  'Medium-sized cutting board with a dark brown handle',
  'لوح تقطيع متوسط ب يد بني غامق',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  550,
  0,
  'medium',
  ARRAY['wood','kitchen','tools','engraved','sheesham','wooden','gifts','board','cutting board','natural wood'']::TEXT[']::TEXT[],
  ARRAY['/images/2-Boards/030-Cutting board /030-Large-Cutting-board-01.webp','/images/2-Boards/030-Cutting board /030-Large-Cutting-board-02.webp','/images/2-Boards/030-Cutting board /030-Large-Cutting-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '029',
  'Rectangle dip plate',
  'طبق مستطيل عميق',
  'Deep rectangular beechwood dish',
  'طبق مستطيل عميق من خشب البيتش',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  0,
  0,
  '',
  ARRAY['wood','kitchen','tools','engraved','beech pine','wooden','gifts','natural wood','tableware','dipping','serving'']::TEXT[']::TEXT[],
  ARRAY['/images/4-serving/029-Rectangle dip plate/029-Rectangle-dip-plate-01.webp','/images/4-serving/029-Rectangle dip plate/029-Rectangle-dip-plate-02.webp','/images/4-serving/029-Rectangle dip plate/029-Rectangle-dip-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '028',
  'medium cutting board',
  'لوح تقطيع متوسط',
  'Medium cutting board',
  'لوح خشبي للتقطيع متوسط',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  675,
  1,
  'medium',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','cutting board','natural wood'']::TEXT[']::TEXT[],
  ARRAY['/images/2-Boards/028-Medium cutting board/028-Medium-Cutting-board-01.webp','/images/2-Boards/028-Medium cutting board/028-Medium-Cutting-board-02.webp','/images/2-Boards/028-Medium cutting board/028-Medium-Cutting-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '027',
  'small Cutting Board',
  'لوح تقطيع صغير',
  'small Cutting Board',
  'لوح تقطيع صغير',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  550,
  1,
  'small',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','cutting board','natural wood'']::TEXT[']::TEXT[],
  ARRAY['/images/2-Boards/027-Small cutting board/027-Small-Cutting-board-01.webp','/images/2-Boards/027-Small cutting board/027-Small-Cutting-board-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '026',
  'Large Cutting board',
  'لوح تقطيع كبير',
  'Large wooden board for the flock',
  'لوح خشبي للتقطيع مقاس كبير',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  800,
  1,
  'large',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','cutting board','natural wood'']::TEXT[']::TEXT[],
  ARRAY['/images/2-Boards/026-Large cutting board/026-large-cutting-board-01.webp','/images/2-Boards/026-Large cutting board/026-large-cutting-board-02.webp','/images/2-Boards/026-Large cutting board/026-large-cutting-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '022',
  'blocks hot dish holder',
  'حامل اطباق ساخنه مكعبات',
  'blocks hot dish holder',
  'حامل اطباق ساخنه مكعبات',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  40,
  0,
  '',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','hot dishes'']::TEXT[']::TEXT[],
  ARRAY['/images/4-serving/022-blocks hot dish holder/022-blocks-hot-dish-holder-01.webp','/images/4-serving/022-blocks hot dish holder/022-blocks-hot-dish-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '021',
  'squares hot dish holder',
  'حامل اطباق ساخنه مربع',
  'squares hot dish holder',
  'حامل اطباق ساخنه مربع',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  40,
  0,
  '',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','hot dishes'']::TEXT[']::TEXT[],
  ARRAY['/images/4-serving/021-squares hot dish holder/021-squares-hot-dish-holder-01.webp','/images/4-serving/021-squares hot dish holder/021-squares-hot-dish-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '020',
  'Stand coasters',
  'حامل كوستر',
  'Coaster holder',
  'حامل ل حامل الاكواب',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  250,
  5,
  '',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','coasters'']::TEXT[']::TEXT[],
  ARRAY['/images/4-serving/020-Stand coasters/020-Stand-coasters-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '019',
  'edged coaster',
  'كوستر بحواف',
  'Cup holder with edges',
  'حامل اكواب بحواف',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  300,
  0,
  '',
  ARRAY['wood','kitchen','tools','engraved','beech pine','wooden','gifts','natural wood','tableware','dipping','serving'']::TEXT[']::TEXT[],
  ARRAY['/images/1-seasons special/019-Edged coaster/019-Edged-coaster-01.webp','/images/1-seasons special/019-Edged coaster/019-Edged-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '016',
  'regtangle coaster',
  'كوستر مستطيل',
  'Rectangular cup holder',
  'حامل اكواب مستطيل',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  250,
  0,
  '',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood'']::TEXT[']::TEXT[],
  ARRAY['/images/1-seasons special/016-Rectangle-Coaster/016-Rectangle-Coaster-01.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '015',
  'big heart coaster',
  'كوستر قلب كبير',
  'Large heart cup holder',
  'حامل اكواب قلب كبير',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  350,
  0,
  '',
  ARRAY['wood','tray','kitchen','tools','engraved','sheesham','wooden','gifts','natural wood','tableware','heart','valentine','special season','valentine','mother''s day'']::TEXT[']::TEXT[],
  ARRAY['/images/1-seasons special/015-Big Heart coaster/013-3-hearts-coaster-01.webp','/images/1-seasons special/015-Big Heart coaster/013-3-hearts-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '014',
  '2 hearts coaster',
  '2 كوستر قلب',
  'eart-shaped cup holder with 2 coasters',
  'حامل اكواب علي شكل قلب 2 كوستر',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  250,
  0,
  '',
  ARRAY['wood','tray','kitchen','tools','engraved','sheesham','wooden','gifts','natural wood','tableware','heart','valentine','special season','valentine','mother''s day'']::TEXT[']::TEXT[],
  ARRAY['/images/1-seasons special/012-2 hearts coaster /012-2-hearts-coaster-01.webp','/images/1-seasons special/012-2 hearts coaster /012-2-hearts-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '013',
  '3 hearts coaster',
  '3 كوستر قلب',
  'Heart-shaped cup holder with 3 coasters',
  'حامل اكواب علي شكل قلب 3 كوستر',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  300,
  0,
  '15*33',
  ARRAY['wood','tray','kitchen','tools','engraved','sheesham','wooden','gifts','natural wood','tableware','heart','valentine','special season','valentine','mother''sday'']::TEXT[']::TEXT[],
  ARRAY['/images/1-seasons special/013-3 hearts coaster/013-3-hearts-coaster-01.webp','/images/1-seasons special/013-3 hearts coaster/013-3-hearts-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '012',
  'big coaster',
  'كوستر كبير',
  'large cup holder',
  'حامل اكواب كبير',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  60,
  0,
  '',
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','hot dishes'']::TEXT[']::TEXT[],
  ARRAY['/images/4-serving/014-Big Coaster/014-Big-Coaster-01.webp','/images/4-serving/014-Big Coaster/014-Big Coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = EXCLUDED.name_ar,
  description_en = EXCLUDED.description_en,
  description_ar = EXCLUDED.description_ar,
  category_id = EXCLUDED.category_id,
  price = EXCLUDED.price,
  stock = EXCLUDED.stock,
  size_en = EXCLUDED.size_en,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;

COMMIT;
