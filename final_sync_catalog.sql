-- Final Product Catalog Sync (Optimized Images & Clean Data)
-- Generated on 2026-04-28T06:55:56.898Z

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
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','coasters']::TEXT[],
  ARRAY['/images/1-seasons special/017-Circle coaster/017-Circle-coaster-01.webp','/images/1-seasons special/017-Circle coaster/017-Circle-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','coasters','tray']::TEXT[],
  ARRAY['/images/1-seasons special/018-Coffee coaster/018-Coffee-coaster-01.webp','/images/1-seasons special/018-Coffee coaster/018-Coffee-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['/images/3-trays/019B-Large Cheese Board/019B-Large Cheese Board-01.webp','/images/3-trays/019B-Large Cheese Board/019B-Large Cheese Board-02.webp','/images/3-trays/019B-Large Cheese Board/019B-Large Cheese Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '044',
  'Cutting board',
  'لوح تقطيع',
  'Large Sheesham wood Cutting board - Size: 46*25',
  'لوح تقطيع خشب السرسوع - المقاس: 46*25',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  800,
  4,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/044-Large Cutting board/044-Large Cutting board-01.webp','/images/2-Boards/044-Large Cutting board/044-Large Cutting board-02.webp','/images/2-Boards/044-Large Cutting board/044-Large Cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '045',
  'Cutting board',
  'لوح تقطيع',
  'Small Sheesham wood Cutting board - Size: 42*25',
  'لوح تقطيع خشب السرسوع - المقاس: 42*25',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  700,
  3,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/045-Cutting board/045-Cutting board-01.webp','/images/2-Boards/045-Cutting board/045-Cutting board-02.webp','/images/2-Boards/045-Cutting board/045-Cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '046',
  'Stripe cutting board',
  'لوح تقطيع مخطط',
  'mix sheesham - Beech Pine Wood cutting board with handle - Size: 42*20',
  'لوح تقطيع من خشب السرسوع و خشب البيتش باين - المقاس: 42*20',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  650,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/046-Stripe cutting board/046-Stripe cutting board-01.webp','/images/2-Boards/046-Stripe cutting board/046-Stripe cutting board-02.webp','/images/2-Boards/046-Stripe cutting board/046-Stripe cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '047',
  'Round cutting board',
  'لوح دائرى للتقطيع',
  'Round sheesham wooden cutting board - Size: 34*29',
  'لوح تقطيع خشبي دائري من خشب السرسوع - المقاس: 34*29',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  600,
  4,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/047-Round cutting board/047-Round cutting board-01.webp','/images/2-Boards/047-Round cutting board/047-Round cutting board-02.webp','/images/2-Boards/047-Round cutting board/047-Round cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '048',
  'Mini Round board',
  'لوح مستدير صغير',
  'Mini Round board with handle - Size: 27*18',
  'لوح مستدير صغير مصنوع من البيتش باين بيد - المقاس: 27*18',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  350,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/048-Mini Round board/048-Mini Round board-01.webp','/images/2-Boards/048-Mini Round board/048-Mini Round board-02.webp','/images/2-Boards/048-Mini Round board/048-Mini Round board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '049',
  'Round sheesham board',
  'بورد دائرى سرسوع',
  'Round sheesham board - Size: 29cm',
  'بورد دائره خشب السرسوع - المقاس: 29cm',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  600,
  6,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/049-Round sheesham board/049-Round sheesham board-01.webp','/images/2-Boards/049-Round sheesham board/049-Round sheesham board-02.webp','/images/2-Boards/049-Round sheesham board/049-Round sheesham board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '050',
  'Kaia large plate',
  'طبق كايا كبير',
  'Large Kaia Wood Plate - Size: 38*23',
  'طبق كبير خشب كايا - المقاس: 38*23',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  800,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/050-Kaia large plate/050-Kaia-large-plate-01.webp','/images/4-serving/050-Kaia large plate/050-Kaia-large-plate-02.webp','/images/4-serving/050-Kaia large plate/050-Kaia-large-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '051-01',
  'Set of Mini plates',
  'طقم اطباق صغيره',
  'Beech Pine wooden plate with handle Set of 2 - Size: 14cm',
  'طبق خشبي من خشب البيتش باين بمقبض خشبي، طقم من قطعتين - المقاس: 14cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  500,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/051-01-Set of Mini plates/051-01-Set of Mini plates-01.webp','/images/4-serving/051-01-Set of Mini plates/051-01-Set of Mini plates-02.webp','/images/4-serving/051-01-Set of Mini plates/051-01-Set of Mini plates-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '051-02',
  'Mini plates',
  'طبق صغير',
  'Small Beech Pine wooden plate with handle - Size: small',
  'طبق خشبي صغير من خشب البيتش باين بمقبض خشبي - المقاس: small',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  250,
  7,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/051-02-Small Mini plate /051-02-Small Mini plate-01.webp','/images/4-serving/051-02-Small Mini plate /051-02-Small Mini plate-02.webp','/images/4-serving/051-02-Small Mini plate /051-02-Small Mini plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '051-03',
  'Mini plates',
  'طبق صغير',
  'Meduim Beech Pine wooden plate with handle - Size: meduim',
  'طبق خشبي وسط من خشب البيتش باين بمقبض خشبي - المقاس: meduim',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  300,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/051-03-Medium Mini plate/051-03-Medium Mini plate-01.webp','/images/4-serving/051-03-Medium Mini plate/051-03-Medium Mini plate-02.webp','/images/4-serving/051-03-Medium Mini plate/051-03-Medium Mini plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '052',
  'Small Heart',
  'طبق قلب صغير',
  'sheesham wooden crafted small heart plate - Size: 24*20',
  'طبق قلب صغير مصنوع من خشب السرسوع - المقاس: 24*20',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  500,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/052-Small-Heart-Plate/052-Small-Heart-Plate-01.webp','/images/4-serving/052-Small-Heart-Plate/052-Small-Heart-Plate-02.webp','/images/4-serving/052-Small-Heart-Plate/052-Small-Heart-Plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '053',
  'Big Heart',
  'طبق قلب كبير',
  'sheesham wooden crafted big heart plate - Size: 26*27',
  'طبق قلب كبير مصنوع من خشب السرسوع - المقاس: 26*27',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  600,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/053-Big Heart/053-Big Heart-01.webp','/images/4-serving/053-Big Heart/053-Big Heart-02.webp','/images/4-serving/053-Big Heart/053-Big Heart-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '054-01',
  'Set of pizza serving plates',
  'مجموعة أطباق تقديم البيتزا',
  'Kaia wooden crafted pizza serving plates set of 3',
  'طقم اطباق بيتزا من خشب كايا طقم 3 قطع',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  1400,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-01png.webp','/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-02.webp','/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '054-02',
  'Small pizza serving plates',
  'طبق بيتزا صغير',
  'Small Kaia wooden crafted pizza serving plates - Size: small',
  'طبق تقديم بيتزا صغير من خشب كايا - المقاس: small',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  400,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '054-03',
  'Meduim pizza serving plates',
  'طبق بيتزا وسط',
  'Meduim Kaia wooden crafted pizza serving plates - Size: meduim',
  'طبق تقديم بيتزا وسط من خشب كايا - المقاس: meduim',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  500,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '054-04',
  'Large pizza serving plates',
  'طبق بيتزا كبير',
  'Large Kaia wooden crafted pizza serving plates - Size: large',
  'طبق تقديم بيتزا كبير من خشب كايا - المقاس: large',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  600,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/054-01-Set-Pizza/054-01-Set-Pizza-01png.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '055',
  'Ramadan napkin holder',
  'حامل مناديل',
  'Ramadan napkin wooden holder - Size: 7*5',
  'حامل مناديل صغير - المقاس: 7*5',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  150,
  10,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/055-Ramadan napkin holder/Ramadan-napkin-holder-01.webp','/images/1-seasons special/055-Ramadan napkin holder/Ramadan-napkin-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '056',
  'Crescent decoration',
  '',
  'Crescent wooden decoration - Size: 18*15',
  'قانوس رمضان خشب صغير - المقاس: 18*15',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  100,
  3,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/056-Crescent decoration/Crescent decoration-01.webp','/images/1-seasons special/056-Crescent decoration/Crescent decoration-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '057',
  'Crescent plate',
  'طبق هلال',
  'Crescent plate Beech Pine wooden - Size: 29*25',
  'طبق هلال خشب بيتش باين - المقاس: 29*25',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  450,
  8,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/057-Crescent plate/Crescent plate-01.webp','/images/1-seasons special/057-Crescent plate/Crescent plate-02.webp','/images/1-seasons special/057-Crescent plate/Crescent plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '058',
  'Ramadan Mosque Plate',
  'طبق رمضان',
  'Beech Pine Ramadan Mosque Plate - Size: 38*28',
  'طبق مسجد رمضان من خشب البيتش باين - المقاس: 38*28',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  600,
  8,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/058-Ramadan Mosque Plate/Ramadan Mosque Plate-01.webp','/images/1-seasons special/058-Ramadan Mosque Plate/Ramadan Mosque Plate-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '059',
  'Lantern plate',
  'طبق فانوس',
  'Beech Pine lantern wooden serving plate - Size: 36*21',
  'طبق فانوس رمضان من خشب البيتش باين - المقاس: 36*21',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  600,
  10,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/059-Lantern plate/059-Lantern plat-01.webp','/images/1-seasons special/059-Lantern plate/059-Lantern plat-02.webp','/images/1-seasons special/059-Lantern plate/059-Lantern plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '060-01',
  'Set of Star serving plate',
  'طقم اطباق نجمه',
  'Set of 2 beech pine wooden star serving plate',
  'طقم اطباق نجمه مصنوع من خشب البيتش باين، طقم مكون من ٣ قطع',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  800,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/060-01-Set of Star serving plate/Set of Star serving plate-01.webp','/images/1-seasons special/060-01-Set of Star serving plate/Set of Star serving plate-02.webp','/images/1-seasons special/060-01-Set of Star serving plate/Set of Star serving plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '060-02',
  'Small Star serving plate',
  'طبق نجمه صغير',
  'Small beech pine wooden star serving plate - Size: small',
  'طبق صغير علي شكل نجمه مصنوع من خشب البيتش باين - المقاس: small',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  250,
  8,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/060-02-Small Star serving plate/Small Star serving plate-01.webp','/images/1-seasons special/060-02-Small Star serving plate/Small Star serving plate-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '060-03',
  'Meduim Star serving plate',
  'طبق نجمه وسط',
  'Meduim beech pine wooden star serving plate - Size: meduim',
  'طبق وسط علي شكل نجمه مصنوع من خشب البيتش باين - المقاس: meduim',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  300,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/060-03-Meduim Star serving plate/Medium-Star-serving-plate-01.webp','/images/1-seasons special/060-03-Meduim Star serving plate/Medium-Star-serving-plate-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '060-04',
  'Large Star serving plate',
  'طبق نجمه كبير',
  'Large beech pine wooden star serving plate - Size: large',
  'طبق كبير علي شكل نجمه مصنوع من خشب البيتش باين - المقاس: large',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  350,
  3,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/060-04-Large Star serving plate/Large Star serving plate-01.webp','/images/1-seasons special/060-04-Large Star serving plate/Large Star serving plate-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '061',
  'Star serving plate',
  'طبق تقديم علي شكل نجمه',
  'Beech Pine star-shaped wooden serving plate - Size: 28cm',
  'طبق خشبي علي شكل نجمه مصنوع من البيتش باين - المقاس: 28cm',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  550,
  9,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/061-Star serving plate/Star serving plate-01.webp','/images/1-seasons special/061-Star serving plate/Star serving plate-02.webp','/images/1-seasons special/061-Star serving plate/Star serving plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '062',
  'Serving set',
  'طقم معالق',
  'Serving set Beech Pine wooden, 4 pieces',
  'طقم معالق بيتش باين',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  400,
  10,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/062-Serving Set/062-Serving Set-01.webp','/images/4-serving/062-Serving Set/062-Serving Set-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '063-01',
  'Set of Crescent Serving Stand, light brown',
  'ستاند تقديم شكل القمر',
  'Set of 2, Wooden crescent-shaped serving stands, easy to assemble and disassemble, light brown',
  'ستاند تقديم شكل القمر خشب',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  1100,
  10,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/063-01-Set of Crescent Serving Stand, light brown/063-01-Set-of-Crescent-Serving-Stand,-light-brown-01.webp','/images/1-seasons special/063-01-Set of Crescent Serving Stand, light brown/063-01-Set-of-Crescent-Serving-Stand,-light-brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '063-02',
  'Small Crescent Serving Stand',
  'ستاند صغير تقديم شكل هلال، بني فاتح',
  'Small Wooden crescent-shaped serving stand, easy to assemble and disassemble, light brown - Size: 59*31',
  'ستاند صغير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني فاتح - المقاس: 59*31',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  500,
  6,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/063-02-Crescent Serving Stand, light brown-small/063-02-Set-of-Crescent-Serving-Stand,-light-brow-small-01.webp','/images/1-seasons special/063-02-Crescent Serving Stand, light brown-small/063-02-Set-of-Crescent-Serving-Stand,-light-brow-small-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '063-03',
  'Large Crescent Serving Stand',
  'ستاند كبير تقديم شكل هلال، بني فاتح',
  'Large Wooden crescent-shaped serving stand, easy to assemble and disassemble, light brown - Size: 50*25',
  'ستاند كبير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني فاتح - المقاس: 50*25',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  500,
  3,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/063-03-Crescent Serving Stand, light brown-large/063-02-Set-of-Crescent-Serving-Stand,-light-brow-large-01.webp','/images/1-seasons special/063-03-Crescent Serving Stand, light brown-large/063-02-Set-of-Crescent-Serving-Stand,-light-brow-large-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '064-01',
  'Set of Crescent Serving Stand, dark brown',
  'ستاند تقديم شكل القمر',
  'Set of 2, Wooden crescent-shaped serving stands, easy to assemble and disassemble, dark brown',
  'ستاند تقديم شكل القمر خشب',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  1100,
  10,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/064-01-Set of Crescent Serving Stand, dark brown/064-01-Set of Crescent Serving Stand, dark brown-01.webp','/images/1-seasons special/064-01-Set of Crescent Serving Stand, dark brown/064-02-Set of Crescent Serving Stand, dark brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '064-02',
  'Small Crescent Serving Stand',
  'ستاند صغير تقديم شكل هلال، بني غامق',
  'Small Wooden crescent-shaped serving stand, easy to assemble and disassemble, dark brown - Size: 50*25',
  'ستاند صغير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني غامق - المقاس: 50*25',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  500,
  7,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/064-02-small of Crescent Serving Stand, dark brown/064-02-Small Crescent Serving Stand, dark brown-01.webp','/images/1-seasons special/064-02-small of Crescent Serving Stand, dark brown/064-02-Small Crescent Serving Stand, dark brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '064-03',
  'Large Crescent Serving Stand',
  'ستاند كبير تقديم شكل هلال، بني غامق',
  'Large Wooden crescent-shaped serving stand, easy to assemble and disassemble, dark brown - Size: 59*31',
  'ستاند كبير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني غامق - المقاس: 59*31',
  (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
  700,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/1-seasons special/064-03-Large of Crescent Serving Stand, dark brown/064-03-Large of Crescent Serving Stand, dark brown-01.webp','/images/1-seasons special/064-03-Large of Crescent Serving Stand, dark brown/064-03-Large of Crescent Serving Stand, dark brown-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '065',
  'Kitchen magnet',
  'مطبخ مغناطيس',
  'Wood "Kitchen" magnet',
  'مغناطيس خشبي مكتوب عليه "مطبخ"',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  100,
  12,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/065-Kitchen Magnet/065-Kitchen Magnet-01.webp','/images/4-serving/065-Kitchen Magnet/065-Kitchen Magnet-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '066',
  'Welcome magnet',
  'اهلا مغناطيس',
  'Wood "Welcome" magnet',
  'مغناطيس خشبي مكتوب عليه "مرحباً"',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  100,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/066-Welcome magnet/066-Welcome magnet-01.webp','/images/4-serving/066-Welcome magnet/066-Welcome magnet-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '067',
  'Cutlery Set Magnet',
  'معالق مغناطيس',
  'Cutlery Set Fridge Magnet, 3 pieces - Size: 18*13',
  'شكل مغناطيس للمطبخ - المقاس: 18*13',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  60,
  22,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/067-Cutlery Set Magnet/067-Cutlery Set Magnet-01.webp','/images/4-serving/067-Cutlery Set Magnet/067-Cutlery Set Magnet-02.webp','/images/4-serving/067-Cutlery Set Magnet/067-Cutlery Set Magnet-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  '{}'::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '069',
  'Pizza Set',
  'طقم بيتزا',
  'A puzzle-style pizza set crafted from natural beech pine wood, 6 pieces',
  'طقم بيتزا 6 قطع مصنوع من خشب البيتش باين',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  900,
  9,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/069-Pizza Set/069-Pizza Set-01.webp','/images/4-serving/069-Pizza Set/069-Pizza Set-02.webp','/images/4-serving/069-Pizza Set/069-Pizza Set-03.webp','/images/4-serving/069-Pizza Set/069-Pizza Set-04.webp','/images/4-serving/069-Pizza Set/069-Pizza Set-05.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '070',
  'Kitchen tissue holder',
  'حامل منديل للمطبخ',
  'Wooden Kitchen paper holder - Size: 36cm',
  'حامل مناديل للمطبخ خشب - المقاس: 36cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  350,
  9,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/070-Kitchen-Tissue/070-Kitchen-tissue-holder-01.webp','/images/4-serving/070-Kitchen-Tissue/070-Kitchen-tissue-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '071',
  'Toilet tissue holder',
  'حامل مناديل للحمام',
  'Wooden Toilet paper holder - Size: 45cm',
  'حامل منايل للحمام خشب - المقاس: 45cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  450,
  10,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/071-Toilet tissue holder/071-Toilet-tissue-holder-01.webp','/images/4-serving/071-Toilet tissue holder/071-Toilet-tissue-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '072',
  'Large Coaster with candle',
  'قاعدة أكواب كبير خشبية مع مكان لشمعة',
  'Large wooden coaster with a candle holder, made of sheesham - Size: large',
  'قاعدة أكواب كبير خشبية مع مكان لشمعة مصنوعة من خشب السرسوع - المقاس: large',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  400,
  3,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/072-Large Coaster with Candle/075-Large Coaster with Candle-01.webp','/images/4-serving/072-Large Coaster with Candle/075-Large Coaster with Candle-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '073',
  'Meduim Coaster with candle',
  'قاعدة أكواب وسط خشبية مع مكان لشمعة',
  'Meduim wooden coaster with a candle holder, made of sheesham - Size: meduim',
  'قاعدة أكواب وسط خشبية مع مكان لشمعة مصنوعة من خشب السرسوع - المقاس: meduim',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  350,
  18,
  '',
  '{}'::TEXT[],
  '{}'::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '074',
  'Small Coaster with candle',
  'قاعدة أكواب صغيرة خشبية مع مكان لشمعة',
  'Small wooden coaster with a candle holder, made of sheesham - Size: small',
  'قاعدة أكواب صغيرة خشبية مع مكان لشمعة مصنوعة من خشب السرسوع - المقاس: small',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  300,
  5,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/074-Small Coaster with Candle/074-Small Coaster with Candle-01.webp','/images/4-serving/074-Small Coaster with Candle/074-Small Coaster with Candle-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '075',
  'Oval Plate',
  'طبق بيضاوى',
  'Oval Beech Pine Wood Plate - Size: 14* 30',
  'طبق بيضاوى مصنوع من خشب البيتش باين - المقاس: 14* 30',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  500,
  10,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/075-Oval Plate/075-Oval-Plate-01.webp','/images/4-serving/075-Oval Plate/075-Oval-Plate-02.webp','/images/4-serving/075-Oval Plate/075-Oval-Plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '076',
  'Square Plate',
  'طبق مربع',
  'Square Beech Pine Wood Plate - Size: 20cm',
  'طبق مربع عميق مصنوع من خشب البيتش باين - المقاس: 20cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  400,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/076-Square-Plate/076-Square-Plate-01.webp','/images/4-serving/076-Square-Plate/076-Square-Plate-02.webp','/images/4-serving/076-Square-Plate/076-Square-Plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '077',
  'Oval Deep Plate',
  'طبق بيضاوى عميق بارجل',
  'oval Beech Pine Wood Plate - Size: 9* 25',
  'طبق بيضاوي الشكل من خشب البيتش باين - المقاس: 9* 25',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  300,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/077-Oval Deep Plate /077-Oval-Deep-Plate-01.webp','/images/4-serving/077-Oval Deep Plate /077-Oval-Deep-Plate-02.webp','/images/4-serving/077-Oval Deep Plate /077-Oval-Deep-Plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '078',
  'Oval Deep Plate with legs',
  'طبق بيضاوى عميق بارجل',
  'oval Beech Pine Wood Plate with legs with an engraved floral detail - Size: 9* 25',
  'طبق بيضاوي الشكل من خشب البيتش باين، مزود بأرجل ونقوش محفورة. - المقاس: 9* 25',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  350,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/078-Oval Deep Plate with legs/078-Oval-Deep-Plate-with-legs-01.webp','/images/4-serving/078-Oval Deep Plate with legs/078-Oval-Deep-Plate-with-legs-02.webp','/images/4-serving/078-Oval Deep Plate with legs/078-Oval-Deep-Plate-with-legs-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '079',
  'Fish Napkin',
  'حامل مناديل سمكه',
  'Fish-Shaped Table Napkins',
  'حامل مناديل خشب على شكل سمكه',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  400,
  31,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/079-Fish-Napkin/079-Fish-Napking-01.webp','/images/4-serving/079-Fish-Napkin/079-Fish-Napking-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '080',
  'Oval dipping plate',
  'طبق غمس بيضاوي',
  'Oval Beech Pine Wood Dipping Sauce Plates, Set of 3',
  'طقم اطباق غمس بيضاوي مصنوع من خشب البيتش باين، مكون من ٣ اطباق',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  100,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/080-Oval dipping plate/080-Oval-dipping-plate-01.webp','/images/4-serving/080-Oval dipping plate/080-Oval-dipping-plate-02.webp','/images/4-serving/080-Oval dipping plate/080-Oval-dipping-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '081',
  'Mini oval dipping plate',
  'طبق غمس بيضاوي صغير',
  'Mini Beech Pine Wood Dipping Sauce Plates, Set of 3',
  'طقم اطباق غمس بيضاوي صغير مصنوع من خشب البيتش باين، مكون من ٣ اطباق',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  100,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/081-Mini oval dipping plate/081-Mini-oval-dipping-plate-01.webp','/images/4-serving/081-Mini oval dipping plate/081-Mini-oval-dipping-plate-02.webp','/images/4-serving/081-Mini oval dipping plate/081-Mini-oval-dipping-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '082-01',
  'Set of wood food warmer',
  'طقم سخان طعام خشبي',
  'Set of 2 wood food warmers',
  'طقم من قطعتين، سخان طعام خشبي',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  700,
  7,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-01.webp','/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-02.webp','/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-03.webp','/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-04.webp','/images/4-serving/082-01-Set-Of-Food-Warmer/082-01-Set-Of-Food-Warmer-05.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '082-02',
  'Large wood food warmer',
  'سخان طعام خشبي كبير',
  'Large wood food warmer with 2 candle places - Size: large',
  'مدفأة طعام خشبية كبيرة مزودة بمكانين للشموع - المقاس: large',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  450,
  7,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/082-02-Large-Food-Warmer/082-02-Large-Food-Warmer-01.webp','/images/4-serving/082-02-Large-Food-Warmer/082-03-Large-Food-Warmer-02.webp','/images/4-serving/082-02-Large-Food-Warmer/082-03-Large-Food-Warmer-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '082-03',
  'Small wood food warmer',
  'سخان طعام خشبي صغير',
  'Small wood food warmer with 1 candle - Size: small',
  'مدفأة طعام خشبية صغيرة مزودة بمكان لشمعة - المقاس: small',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  350,
  17,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/082-03-Small-Food-Warmer/082-02-Small-Food-Warmer-01.webp','/images/4-serving/082-03-Small-Food-Warmer/082-02-Small-Food-Warmer-02.webp','/images/4-serving/082-03-Small-Food-Warmer/082-02-Small-Food-Warmer-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '083-01',
  'Set of Rectangle Plates',
  'طقم أطباق مستطيلة',
  'Set of 3 rectangle sheesham wooden plates',
  'طقم اطباق مستطيله مصنوع من خشب السرسوع ، طقم مكون من ٣ قطع',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  1100,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/083-01-set-of-rectangle-plates/083-01-set-of-rectangle-plates-01.webp','/images/4-serving/083-01-set-of-rectangle-plates/083-01-set-of-rectangle-plates-02.webp','/images/4-serving/083-01-set-of-rectangle-plates/083-01-set-of-rectangle-plates-03.webp','/images/4-serving/083-01-set-of-rectangle-plates/083-01-set-of-rectangle-plates-04.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '083-02',
  'Small Rectangle Plates',
  'طبق مستطيل صغير',
  'Small rectangle sheesham wooden plates - Size: small',
  'طبق مستطيل صغير مصنوع من خشب السرسوع - المقاس: small',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  350,
  4,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/083-02-Small-rectangle-plates/083-01-set-of-rectangle-plates-01.webp','/images/4-serving/083-02-Small-rectangle-plates/083-01-set-of-rectangle-plates-02.webp','/images/4-serving/083-02-Small-rectangle-plates/083-01-set-of-rectangle-plates-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '083-03',
  'Meduim Rectangle Plates',
  'طبق مستطيل وسط',
  'Meduim rectangle sheesham wooden plates - Size: meduim',
  'طبق مستطيل وسط مصنوع من خشب السرسوع - المقاس: meduim',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  400,
  2,
  '',
  '{}'::TEXT[],
  '{}'::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '083-04',
  'Large Rectangle Plates',
  'طبق مستطيل كبير',
  'Large rectangle sheesham wooden plates - Size: large',
  'طبق مستطيل كبير مصنوع من خشب السرسوع - المقاس: large',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  450,
  6,
  '',
  '{}'::TEXT[],
  '{}'::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '084',
  'Sheesham Plate',
  'طبق صغير',
  'sheesham wooden plate - Size: 16cm',
  'طبق صغير خشب سرسوع - المقاس: 16cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  450,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/084-sheesham wooden plate/084-sheesham-wooden-plate-01.webp','/images/4-serving/084-sheesham wooden plate/084-sheesham-wooden-plate-02.webp','/images/4-serving/084-sheesham wooden plate/084-sheesham-wooden-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '085',
  'X-Large Bowl',
  'طبق عميق كبير',
  'X-Large sheesham wooden bowl - Size: 27cm',
  'طبق عميق كبير مصنوع من خشب سرسوع - المقاس: 27cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  450,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/085-XLarge-Bowl/085-XL-Bowl-01.webp','/images/4-serving/085-XLarge-Bowl/085-XL-Bowl-02.webp','/images/4-serving/085-XLarge-Bowl/085-XL-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '086',
  'Large Bowl',
  'طبق عميق كبير',
  'Large sheesham wooden bowl - Size: 22cm',
  'طبق عميق كبير مصنوع من خشب سرسوع - المقاس: 22cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  400,
  19,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/086-Large-Bowl/086-Large-Bowl-01.webp','/images/4-serving/086-Large-Bowl/086-Large-Bowl-02.webp','/images/4-serving/086-Large-Bowl/086-Large-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '087',
  'Meduim Bowl',
  'طبق عميق وسط',
  'Meduim sheesham wooden bowl - Size: 19cm',
  'طبق عميق وسط مصنوع من خشب سرسوع - المقاس: 19cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  350,
  7,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/087-Medium-Bowl/087-Medium-Bowl-01.webp','/images/4-serving/087-Medium-Bowl/087-Medium-Bowl-02.webp','/images/4-serving/087-Medium-Bowl/87-Medium-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '088',
  'Small Bowl',
  'طبق عميق صغير',
  'Small sheesham wooden bowl - Size: 16cm',
  'طبق عميق صغير مصنوع من خشب سرسوع - المقاس: 16cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  300,
  12,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/088-Small-Bowl/088-Small-Bowl-01.webp','/images/4-serving/088-Small-Bowl/088-Small-Bowl-02.webp','/images/4-serving/088-Small-Bowl/088-Small-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '089-01',
  'Set of Deep Bowls',
  'طقم اطباق كايا عميق',
  'Set of 3 Kaia wooden deep bowls - Size: 25*13, 32*11, 28*12',
  'طقم اطباق كايا عميق ، ٣ اطباق - المقاس: 25*13, 32*11, 28*12',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  2000,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/089-01-Set-Of-Deep-Bowls/089-01-Set-Of-Deep-Bowls-01.webp','/images/4-serving/089-01-Set-Of-Deep-Bowls/089-01-Set-Of-Deep-Bowls-02.webp','/images/4-serving/089-01-Set-Of-Deep-Bowls/089-01-Set-Of-Deep-Bowls-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '089-02',
  'Large Deep Bowl',
  'طبق كايا عميق كبير',
  'Large Kaia wooden deep bowl - Size: 28*12',
  'طبق عميق خشب كايا - المقاس: 28*12',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  800,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/089-02-Large-Deep-Bowl/089-02-large-Deep-Bowl-02.webp','/images/4-serving/089-02-Large-Deep-Bowl/089-02-large-Deep-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '089-03',
  'Meduim Deep Bowl',
  'طبق كايا عميق وسط',
  'Meduim Kaia wooden deep bowl - Size: 32*11',
  'طبق عميق خشب كايا - المقاس: 32*11',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  700,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/089-03-Medium-Deep-Bowl/089-03-Medium-Deep-Bowl-02.webp','/images/4-serving/089-03-Medium-Deep-Bowl/089-03-Medium-Deep-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '089-04',
  'Small Deep Bowl',
  'طبق كايا عميق صغير',
  'Small Kaia wooden deep bowl - Size: 25* 13',
  'طبق عميق خشب كايا - المقاس: 25* 13',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  600,
  10,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/089-04-Small-Deep-Bowl/089-04-Small-Deep-Bowl-02.webp','/images/4-serving/089-04-Small-Deep-Bowl/089-04-Small-Deep-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '090',
  'Meduim Bowl',
  'طبق كايا وسط',
  'Kaia wooden crafted big bowl - Size: 33-35',
  'طبق كايا خشب وسط - المقاس: 33-35',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  700,
  5,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/090-Medium-Bowl/090-Medium-Bowl-01.webp','/images/4-serving/090-Medium-Bowl/090-Medium-Bowl-02.webp','/images/4-serving/090-Medium-Bowl/090-Medium-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '091',
  'Large Bowl',
  'طبق كايا كبير',
  'Kaia wooden crafted big bowl - Size: 37-40cm',
  'طبق كايا خشب كبير - المقاس: 37-40cm',
  (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
  850,
  6,
  '',
  '{}'::TEXT[],
  ARRAY['/images/4-serving/091-LargeBowl/091-Large-Bowl-01.webp','/images/4-serving/091-LargeBowl/091-Large-Bowl-02.webp','/images/4-serving/091-LargeBowl/091-Large-Bowl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '092',
  'The Grill',
  'شوايه',
  'Beech pine wood grill, detachable and assembleable - Size: 26*50',
  'شواية خشب بيتش باين قابلة للفك والتركيب - المقاس: 26*50',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  1000,
  5,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/92-The Grill/092-The-Grill-01.webp','/images/3-trays/92-The Grill/092-The-Grill-02.webp','/images/3-trays/92-The Grill/092-The-Grill-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '093-01',
  'Set of wooden tray with wood handle',
  'طقم صواني خشب بيد خشبية',
  'Set of 3 wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 43*20, 48*25, 53*29',
  'صوانى تقديم مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه ، ٣ صواني - المقاس: 43*20, 48*25, 53*29',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  2000,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/093-01-Set of wooden tray with wood handle/trayset-01.webp','/images/3-trays/093-01-Set of wooden tray with wood handle/trayset-02.webp','/images/3-trays/093-01-Set of wooden tray with wood handle/trayset-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '093-02',
  'large wooden tray with wood handle',
  'صنيه صغيرة خشب بيد خشبية',
  'Large wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 43*20',
  'صنية تقديم صغيرة مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه - المقاس: 43*20',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  850,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/093-02-Large of wooden tray with wood handle/093-02-Large of wooden tray with wood handle-01.webp','/images/3-trays/093-02-Large of wooden tray with wood handle/093-02-Large of wooden tray with wood handle-02.webp','/images/3-trays/093-02-Large of wooden tray with wood handle/093-02-Large of wooden tray with wood handle-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '093-03',
  'meduim wooden tray with wood handle',
  'صنيه وسط خشب بيد خشبية',
  'Meduim wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 48*25',
  'صنية تقديم وسط مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه - المقاس: 48*25',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  750,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/093-03-Medium of wooden tray with wood handle /093-03-Medium of wooden tray with wood handle-01.webp','/images/3-trays/093-03-Medium of wooden tray with wood handle /093-03-Medium of wooden tray with wood handle-02.webp','/images/3-trays/093-03-Medium of wooden tray with wood handle /093-03-Medium of wooden tray with wood handle-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '093-04',
  'small wooden tray with wood handle',
  'صنيه كبيرة خشب بيد خشبية',
  'Small wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 53*29',
  'صنية تقديم كبيرة مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه - المقاس: 53*29',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  650,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/093-04-Small of wooden tray with wood handle/093-04-Small of wooden tray with wood handle-01.webp','/images/3-trays/093-04-Small of wooden tray with wood handle/093-04-Small of wooden tray with wood handle-02.webp','/images/3-trays/093-04-Small of wooden tray with wood handle/093-04-Small of wooden tray with wood handle-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '094',
  'Wooden tray with handle',
  'صينية خشب بيد',
  'sheesham Wooden Tray with black handle - Size: 47*31',
  'صنيه تقديم مصنوعه من خشب السرسوع بأيدى سوداء - المقاس: 47*31',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  950,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/094-Wooden tray with handle/094-Wooden tray with handl-01.webp','/images/3-trays/094-Wooden tray with handle/094-Wooden tray with handl-02.webp','/images/3-trays/094-Wooden tray with handle/094-Wooden tray with handl-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '095-01',
  'Puzzle Board Set',
  'طقم ألواح بازل',
  'mix sheesham - Beech Pine Wood Puzzle Cheese Board, 2 pieces - Size: 40cm & 50 cm',
  'طقم ألواح بازل مصنوعه من خشب السرسوع و البيتش باين، مكون من قطعتين - المقاس: 40cm & 50 cm',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  800,
  5,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-01.webp','/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-02.webp','/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-03.webp','/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-04.webp','/images/2-Boards/095-01-Puzzle Board Set/095-01-Puzzle Board Set-05.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '095-02',
  'Small Puzzle Board',
  'لوح بازل صغير',
  'mix sheesham - Beech Pine Wood Puzzle Cheese Board - Size: 40cm',
  'لوح بازل صغير مصنوع من خشب السرسوع و البيتش باين - المقاس: 40cm',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  400,
  5,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/095-02-Small Puzzle Board /095-02-Small Puzzle Board-01.webp','/images/2-Boards/095-02-Small Puzzle Board /095-02-Small Puzzle Board-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '095-03',
  'Large Puzzle Board',
  'لوح بازل كبير',
  'mix sheesham - Beech Pine Wood Puzzle Cheese Board - Size: 50sm',
  'لوح بازل كبير مصنوع من خشب السرسوع و البيتش باين - المقاس: 50sm',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  500,
  5,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/095-03-Large Puzzle Board/095-03-Large Puzzle Board-01.webp','/images/2-Boards/095-03-Large Puzzle Board/095-03-Large Puzzle Board-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '096',
  'Sheesham cutting board',
  'لوح تقطيع',
  'Large sheesham Wooden cutting board - Size: 52 *17',
  'لوح تقطيع كبير مصنوع خشب السرسوع - المقاس: 52 *17',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  650,
  4,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/096-Sheesham cutting board /096-Sheesham cutting board-01.webp','/images/2-Boards/096-Sheesham cutting board /096-Sheesham cutting board-02.webp','/images/2-Boards/096-Sheesham cutting board /096-Sheesham cutting board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '097',
  'Sheesham cutting board',
  'لوح تقطيع',
  'Small sheesham Wooden cutting board - Size: 40 * 20',
  'لوح تقطيع صغير مصنوع خشب السرسوع - المقاس: 40 * 20',
  (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
  600,
  3,
  '',
  '{}'::TEXT[],
  ARRAY['/images/2-Boards/097- Small Sheesham cutting board/097-Small Sheesham-cutting-board-01.webp','/images/2-Boards/097- Small Sheesham cutting board/097-Small Sheesham-cutting-board-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '098',
  'Flat Cheese Board',
  'لوح خشبي كبير مسطح',
  'Flat Large cheese board, crafted from Beech Pine - Size: 50cm',
  'لوح جبن كبير مسطح من خشب البيتش - المقاس: 50cm',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  350,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/098-Flat Cheese Board/098-Flat Cheese Board-01.webp','/images/3-trays/098-Flat Cheese Board/098-Flat Cheese Board-02.webp','/images/3-trays/098-Flat Cheese Board/098-Flat Cheese Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '099',
  'Deep Cheese Board',
  'لوح خشبي كبير محفور',
  'Deep Large cheese board, crafted from Beech Pine - Size: 50 cm',
  'لوح جبن كبير محفور من خشب البيتش – عميق - المقاس: 50 cm',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  400,
  1,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/099-Deep Cheese Board/099-Deep Cheese Board-01.webp','/images/3-trays/099-Deep Cheese Board/099-Deep Cheese Board-02.webp','/images/3-trays/099-Deep Cheese Board/099-Deep Cheese Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '100-01',
  'Set of Bloom Board',
  'طقم ألواح خشبية منقوش',
  'Set of 2, Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 40cm, 50 cm',
  'طقم ألواح خشبية منقوش مصنوع من خشب البيتش الطبيعي ، مكون من قطعتين - المقاس: 40cm, 50 cm',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  600,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/100-01-Set of Bloom Board/100-01-Set of Bloom Board-01.webp','/images/3-trays/100-01-Set of Bloom Board/100-01-Set of Bloom Board-02.webp','/images/3-trays/100-01-Set of Bloom Board/100-01-Set of Bloom Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '100-02',
  'Small Bloom Board',
  'لوح خشبي صغير منقوش',
  'Small Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 40cm',
  'لوح خشبي صغيرمنقوش مصنوع من خشب البيتش الطبيعي - المقاس: 40cm',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  300,
  3,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/100-02-Small Bloom Board/100-02-Small-Bloom-Board-01.webp','/images/3-trays/100-02-Small Bloom Board/100-02-Small-Bloom-Board-02.webp','/images/3-trays/100-02-Small Bloom Board/100-02-Small-Bloom-Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;
INSERT INTO public.products (sku, name_en, name_ar, description_en, description_ar, category_id, price, stock, size_en, tags, images)
VALUES (
  '100-03',
  'Large Bloom Board',
  'لوح خشبي كبير منقوش',
  'Large Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 50 cm',
  'لوح خشبي كبير مصنوع من خشب البيتش الطبيعي - المقاس: 50 cm',
  (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
  350,
  2,
  '',
  '{}'::TEXT[],
  ARRAY['/images/3-trays/100-03-Large Bloom Board copy/100-03-Large-Bloom-Board-01.webp','/images/3-trays/100-03-Large Bloom Board copy/100-03-Large-Bloom-Board-02.webp','/images/3-trays/100-03-Large Bloom Board copy/100-03-Large-Bloom-Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','glasses','movie nights','gathering']::TEXT[],
  ARRAY['/images/2-Boards/041-Board with Ears/041-Board with Ears-03.webp','/images/2-Boards/041-Board with Ears/041-Board-with-Ears-01.webp','/images/2-Boards/041-Board with Ears/041-Board-with-Ears-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','movie nights','gathering']::TEXT[],
  ARRAY['/images/4-serving/040-Waves board/040-Waves-Board-01.webp','/images/4-serving/040-Waves board/040-Waves-Board-02.webp','/images/4-serving/040-Waves board/040-Waves-Board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','tacos']::TEXT[],
  ARRAY['/images/4-serving/039-Meduim Taco Holder/039-Meduim Taco Holder-01.webp','/images/4-serving/039-Meduim Taco Holder/039-Meduim Taco Holder-03.webp','/images/4-serving/039-Meduim Taco Holder/039-Meduim-Taco-Holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','tacos']::TEXT[],
  ARRAY['/images/4-serving/038-Small Taco Holder/038-Small Taco Holder-03.webp','/images/4-serving/038-Small Taco Holder/038-Small-Taco-Holder-01.webp','/images/4-serving/038-Small Taco Holder/038-Small-Taco-Holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','sushi','gathering','tray']::TEXT[],
  ARRAY['/images/3-trays/036-large Sushi tray/036-large-Sushi-tray-01.webp','/images/3-trays/036-large Sushi tray/036-large-Sushi-tray-02.webp','/images/3-trays/036-large Sushi tray/036-large-Sushi-tray-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','glasses','sushi','gathering','tray']::TEXT[],
  ARRAY['/images/3-trays/035-Disassembly and assembly board/035-Disassembly-and-assembly-board-01.webp','/images/3-trays/035-Disassembly and assembly board/035-Disassembly-and-assembly-board-02.webp','/images/3-trays/035-Disassembly and assembly board/035-Disassembly-and-assembly-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','serving']::TEXT[],
  ARRAY['/images/4-serving/034-Small Split serving board 2/034-Small-Split-serving-board-01.webp','/images/4-serving/034-Small Split serving board 2/034-Small-Split-serving-board-02.webp','/images/4-serving/034-Small Split serving board 2/034-Small-Split-serving-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','tableware','serving','beech pine','wood plate','serving plate','ramadan','special season','christmas','star','dipping']::TEXT[],
  ARRAY['/images/1-seasons special/033-Large-Star/033-Large-Star-01.webp','/images/1-seasons special/033-Large-Star/033-Large-Star-02.webp','/images/1-seasons special/033-Large-Star/033-Large-Star-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','tableware','serving','beech pine','wood plate','serving plate','ramadan','special season','christmas','star','dipping']::TEXT[],
  ARRAY['/images/1-seasons special/032-small-Star/032-small-Star-01.webp','/images/1-seasons special/032-small-Star/032-small-Star-02.webp','/images/1-seasons special/032-small-Star/032-small-Star-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','sheesham','wooden','gifts','board','cutting board','natural wood']::TEXT[],
  ARRAY['/images/2-Boards/030-Cutting board /030-Large-Cutting-board-01.webp','/images/2-Boards/030-Cutting board /030-Large-Cutting-board-02.webp','/images/2-Boards/030-Cutting board /030-Large-Cutting-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','beech pine','wooden','gifts','natural wood','tableware','dipping','serving']::TEXT[],
  ARRAY['/images/4-serving/029-Rectangle dip plate/029-Rectangle-dip-plate-01.webp','/images/4-serving/029-Rectangle dip plate/029-Rectangle-dip-plate-02.webp','/images/4-serving/029-Rectangle dip plate/029-Rectangle-dip-plate-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','cutting board','natural wood']::TEXT[],
  ARRAY['/images/2-Boards/028-Medium cutting board/028-Medium-Cutting-board-01.webp','/images/2-Boards/028-Medium cutting board/028-Medium-Cutting-board-02.webp','/images/2-Boards/028-Medium cutting board/028-Medium-Cutting-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','cutting board','natural wood']::TEXT[],
  ARRAY['/images/2-Boards/027-Small cutting board/027-Small-Cutting-board-01.webp','/images/2-Boards/027-Small cutting board/027-Small-Cutting-board-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','cutting board','natural wood']::TEXT[],
  ARRAY['/images/2-Boards/026-Large cutting board/026-large-cutting-board-01.webp','/images/2-Boards/026-Large cutting board/026-large-cutting-board-02.webp','/images/2-Boards/026-Large cutting board/026-large-cutting-board-03.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','hot dishes']::TEXT[],
  ARRAY['/images/4-serving/022-blocks hot dish holder/022-blocks-hot-dish-holder-01.webp','/images/4-serving/022-blocks hot dish holder/022-blocks-hot-dish-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','hot dishes']::TEXT[],
  ARRAY['/images/4-serving/021-squares hot dish holder/021-squares-hot-dish-holder-01.webp','/images/4-serving/021-squares hot dish holder/021-squares-hot-dish-holder-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','coasters']::TEXT[],
  ARRAY['/images/4-serving/020-Stand coasters/020-Stand-coasters-02.webp','/images/4-serving/020-Stand coasters/020-Stand-coasters-0`.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','beech pine','wooden','gifts','natural wood','tableware','dipping','serving']::TEXT[],
  ARRAY['/images/1-seasons special/019-Edged coaster/019-Edged-coaster-01.webp','/images/1-seasons special/019-Edged coaster/019-Edged-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood']::TEXT[],
  ARRAY['/images/1-seasons special/016-Rectangle-Coaster/016-Rectangle-Coaster-01.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','tray','kitchen','tools','engraved','sheesham','wooden','gifts','natural wood','tableware','heart','valentine','special season','valentine','mother''s day']::TEXT[],
  ARRAY['/images/1-seasons special/015-Big Heart coaster/013-3-hearts-coaster-01.webp','/images/1-seasons special/015-Big Heart coaster/013-3-hearts-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','tray','kitchen','tools','engraved','sheesham','wooden','gifts','natural wood','tableware','heart','valentine','special season','valentine','mother''s day']::TEXT[],
  ARRAY['/images/4-serving/014-Big Coaster/014-Big Coaster-02.webp','/images/4-serving/014-Big Coaster/014-Big-Coaster-01.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','tray','kitchen','tools','engraved','sheesham','wooden','gifts','natural wood','tableware','heart','valentine','special season','valentine','mother''sday']::TEXT[],
  ARRAY['/images/1-seasons special/013-3 hearts coaster/013-3-hearts-coaster-01.webp','/images/1-seasons special/013-3 hearts coaster/013-3-hearts-coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
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
  ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','hot dishes']::TEXT[],
  ARRAY['/images/4-serving/014-Big Coaster/014-Big-Coaster-01.webp','/images/4-serving/014-Big Coaster/014-Big Coaster-02.webp']::TEXT[]
)
ON CONFLICT (sku) DO UPDATE SET
  name_en = EXCLUDED.name_en,
  name_ar = CASE WHEN EXCLUDED.name_ar <> '' THEN EXCLUDED.name_ar ELSE public.products.name_ar END,
  description_en = CASE WHEN EXCLUDED.description_en <> '' THEN EXCLUDED.description_en ELSE public.products.description_en END,
  description_ar = CASE WHEN EXCLUDED.description_ar <> '' THEN EXCLUDED.description_ar ELSE public.products.description_ar END,
  category_id = EXCLUDED.category_id,
  price = CASE WHEN EXCLUDED.price > 0 THEN EXCLUDED.price ELSE public.products.price END,
  stock = EXCLUDED.stock,
  size_en = CASE WHEN EXCLUDED.size_en <> '' THEN EXCLUDED.size_en ELSE public.products.size_en END,
  tags = EXCLUDED.tags,
  images = EXCLUDED.images;

COMMIT;
