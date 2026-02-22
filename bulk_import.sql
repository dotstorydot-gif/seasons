-- 1. Insert new categories if they don't exist
INSERT INTO public.categories (name_en, name_ar, slug)
VALUES ('Boards', 'ألواح تقديم', 'boards'),
    ('Serving', 'أدوات تقديم', 'serving'),
    ('Trays', 'صواني', 'trays'),
    ('Seasons Specials', 'إصدارات المواسم', 'seasons') ON CONFLICT (slug) DO NOTHING;
-- 2. Bulk Product Import
-- Arabic translations added for all products
INSERT INTO public.products (
        category_id,
        name_en,
        name_ar,
        description_en,
        description_ar,
        price,
        sku,
        stock,
        is_featured
    )
VALUES (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Pizza Plates', 'أطباق بيتزا', 'Kaia wooden crafted plates - Set of 3', 'أطباق كايا الخشبية المصنوعة يدويًا - طقم من 3 قطع', 2000, '001', 10, true
    ),
    (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Big Bowl', 'وعاء كبير', 'Kaia wooden crafted big bowl - 36cm', 'وعاء كايا الخشبية الكبير المصنوع يدويًا - 36 سم', 900, '002', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Deep Bowl', 'وعاء عميق', 'Kaia wooden crafted deep bowl - 13*25', 'وعاء كايا الخشبية العميق المصنوع يدويًا - 13*25', 500, '003', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Deep Bowl', 'وعاء عميق', 'Sheesham wooden crafted deep bowl - 22cm', 'وعاء شيشام الخشبية العميق المصنوع يدويًا - 22 سم', 450, '004', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Bowls', 'أوعية', 'Sheesham wooden bowls, set of 2 - 21cm & 16cm', 'أوعية شيشام الخشبية، طقم من قطعتين - 21 سم و 16 سم', 450, '005', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Small Plate', 'طبق صغير', 'Sheesham wooden crafted small plate - 16cm', 'طبق شيشام الخشبية الصغير المصنوع يدويًا - 16 سم', 450, '006', 0, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Big Heart Plate', 'طبق قلب كبير', 'Sheesham wooden crafted big heart plate - 26*27', 'طبق قلب شيشام الخشبية الكبير المصنوع يدويًا - 26*27', 600, '007', 0, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Small Heart Plate', 'طبق قلب صغير', 'Sheesham wooden crafted small heart plate - 24*20', 'طبق قلب شيشام الخشبية الصغير المصنوع يدويًا - 24*20', 500, '008', 0, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Rectangle Plates', 'أطباق مستطيلة', 'Sheesham wooden crafted rectangle plates, set of 3', 'أطباق شيشام الخشبية المستطيلة المصنوعة يدويًا، طقم من 3 قطع', 1800, '009', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Candlesticks', 'شمعدانات', 'Wooden candlesticks, set of 2', 'شمعدانات خشبية، طقم من قطعتين', 450, '010', 22, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Dipping Sauce Plates', 'أطباق صوص', 'Very Small Beech Pine Wood Dipping Sauce Plates, Set of 3', 'أطباق غمس صغيرة جدًا من خشب الزان، طقم من 3 قطع', 100, '011', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Fish Napkins', 'مناديل سمك', 'Fish-Shaped Table Napkins', 'مناديل مائدة على شكل سمكة', 400, '013', 31, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Oval Plate', 'طبق بيضاوي', 'Oval Beech Pine Wood Plates, Set of 2 - 9*25', 'أطباق زان بيضاوية، طقم من قطعتين - 9*25', 350, '014', 1, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Square Plate', 'طبق مربع', 'Square Beech Pine Wood Plates - 20cm', 'أطباق زان مربعة - 20 سم', 400, '015', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Oval Plate', 'طبق بيضاوي', 'Oval Beech Pine Wood Plate - 14*30', 'طبق زان بيضاوي - 14*30', 450, '016', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Candle Coasters', 'قواعد شموع', 'Oval 2 Candle Coasters + Round 1 Candle Coaster sheesham', 'قاعدتان بيضاويتان للشموع + قاعدة مستديرة للشموع من خشب الشيشام', 450, '017', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Deep Bowls', 'أوعية عميقة', 'Deep Beech Pine Wood Bowls, Set of 3', 'أوعية زان عميقة، طقم من 3 قطع', 2200, '018', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Small Cheese Board', 'لوح جبن صغير', 'Graved small cheese wood board Beech Pine Wood - 40cm', 'لوح جبن خشب زان محفور صغير - 40 سم', 700, '019', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Large Cheese Board', 'لوح جبن كبير', 'Graved Large cheese wood board Beech Pine Wood - 50 cm', 'لوح جبن خشب زان محفور كبير - 50 سم', 400, '019B', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Cheese Board', 'لوح جبن', 'Wooden Cheese Tray Beech Pine Wood - 50cm', 'صينية جبن خشبية زان - 50 سم', 350, '020', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Cutting Board', 'لوح تقطيع', 'Sheesham Wooden cutting board - 46 * 20', 'لوح تقطيع خشب شيشام - 46 * 20', 700, '021', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Cutting Board Large', 'لوح تقطيع كبير', 'Sheesham Wooden cutting board - 52 * 17', 'لوح تقطيع خشب شيشام - 52 * 17', 650, '022', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Puzzle Cheese Board', 'لوح جبن بازل', 'Mix sheesham - Beech Pine Wood Puzzle Cheese Board, 2 pieces', 'لوح جبن بازل مزيج من خشب الشيشام والزان، قطعتين', 900, '023', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Wooden Plate with handle', 'طبق خشبي بمقبض', 'Beech Pine wooden plate with handle - 14cm', 'طبق خشب زان بمقبض - 14 سم', 650, '024', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Rosewood plate', 'طبق خشب الورد', 'Kaia wooden crafted - 38*23', 'كايا الخشبية المصنوعة يدويًا - 38*23', 800, '025', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Round rosewood plate', 'طبق خشب الورد المستدير', 'Round sheesham plate, set of 2 - 29cm', 'طبق شيشام مستدير، طقم من قطعتين - 29 سم', 600, '026', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Toilet paper holder', 'حامل ورق تواليت', 'Wooden Toilet paper holder - 45cm', 'حامل ورق تواليت خشبي - 45 سم', 500, '027', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Kitchen paper holder', 'حامل ورق مطبخ', 'Wooden Kitchen paper holder - 36cm', 'حامل ورق مطبخ خشبي - 36 سم', 400, '028', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Pizza Set', 'طقم بيتزا', 'Beech Pine wooden-acrylic pizza set - Set of 6', 'طقم بيتزا خشب زان وأكريليك - طقم من 6 قطع', 800, '029', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Tray with black handle', 'صينية بمقبض أسود', 'Sheesham Wooden Tray with black handle - 47*31', 'صينية خشب شيشام بمقبض أسود - 47*31', 950, '030', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Tray Set', 'طقم صواني', 'Beech pine traies, set of 3', 'صواني زان، طقم من 3 قطع', 2500, '031', 10, true
    ),
    (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'The Grill', 'الشواية', 'Beech pine wooden grill - 26*50', 'شواية خشب زان - 26*50', 1000, '032', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Disposable Cutlery', 'أدوات مائدة خشبية', 'Disposable wood cutlery, set of 12', 'أدوات مائدة خشبية للاستخدام مرة واحدة، طقم من 12 قطعة', 100, '033', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Round tray', 'صينية مستديرة', 'Beech Pine wooden - 27*18', 'خشب زان - 27*18', 350, '034', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'seasons'
            LIMIT 1
        ), 'Ramadan Plate', 'طبق رمضان', 'Beech Pine wooden - 28cm', 'خشب زان - 28 سم', 550, '035', 10, true
    ),
    (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'seasons'
            LIMIT 1
        ), 'Star Plate', 'طبق نجمة', 'Beech Pine wooden - 24*22', 'خشب زان - 24*22', 610, '037', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'seasons'
            LIMIT 1
        ), 'Lantern Plate', 'طبق فانوس', 'Beech Pine wooden - 36*21', 'خشب زان - 36*21', 600, '039', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'seasons'
            LIMIT 1
        ), 'Ramadan Plate Large', 'طبق رمضان كبير', 'Beech Pine wooden - 38*28', 'خشب زان - 38*28', 600, '041', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Round Rosewood Plate II', 'طبق خشب الورد المستدير 2', 'Sheesham wooden board - 34*29', 'لوح خشب شيشام - 34*29', 600, '044', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'boards'
            LIMIT 1
        ), 'Round Rosewood Plate III', 'طبق خشب الورد المستدير 3', 'Sheesham wooden board - 34*30', 'لوح خشب شيشام - 34*30', 600, '046', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Cutting Board Mix', 'لوح تقطيع مختلط', 'Mix sheesham - Beech Pine Wood board - 42*20', 'لوح خشب شيشام وزان - 42*20', 650, '050', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'trays'
            LIMIT 1
        ), 'Cutting Board Sheesham', 'لوح تقطيع شيشام', 'Sheesham wood - 42*25', 'خشب شيشام - 42*25', 800, '051', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'seasons'
            LIMIT 1
        ), 'Crescent Plate', 'طبق هلال', 'Beech Pine wooden - 29*25', 'خشب زان - 29*25', 450, '052', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'seasons'
            LIMIT 1
        ), 'Ramadan Wood Small', 'خشب رمضان صغير', 'Wood - 18*15', 'خشب - 18*15', 150, '054', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'seasons'
            LIMIT 1
        ), 'Ramadan Wood Mini', 'خشب رمضان ميني', 'Wood - 7*5', 'خشب - 7*5', 150, '055', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Cutlery Set Magnet', 'مغناطيس طقم أدوات مائدة', 'Wood - 18*13', 'خشب - 18*13', 60, '056', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Welcome Magnet', 'مغناطيس ترحيب', 'Wood', 'خشب', 150, '057', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Kitchen Magnet', 'مغناطيس مطبخ', 'Wood', 'خشب', 150, '058', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Moon Serving Stand S', 'ستاند تقديم القمر صغير', 'Wood - 50*25', 'خشب - 50*25', 500, '059', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Moon Serving Stand L', 'ستاند تقديم القمر كبير', 'Wood - 59*31', 'خشب - 59*31', 700, '060', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Moon Serving Stand (Wood)', 'ستاند تقديم القمر (خشب)', 'Wood - 50*25', 'خشب - 50*25', 500, '061', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Moon Serving Stand (Wood) II', 'ستاند تقديم القمر (خشب) 2', 'Wood - 50*25', 'خشب - 50*25', 500, '062', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Moon Serving Stand (Wood) III', 'ستاند تقديم القمر (خشب) 3', 'Wood - 59*31', 'خشب - 59*31', 700, '063', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Moon Serving Stand (Wood) IV', 'ستاند تقديم القمر (خشب) 4', 'Wood - 59*31', 'خشب - 59*31', 700, '064', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Moon Serving Stand Premium', 'ستاند تقديم القمر متميز', 'Wood', 'خشب', 1200, '065', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Moon Serving Stand Premium II', 'ستاند تقديم القمر متميز 2', 'Wood', 'خشب', 1200, '066', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Moon Serving Stand Premium III', 'ستاند تقديم القمر متميز 3', 'Wood', 'خشب', 1200, '067', 10, false
    ), (
        (
            SELECT id
            FROM public.categories
            WHERE slug = 'serving'
            LIMIT 1
        ), 'Cutlery Set', 'طقم أدوات مائدة', 'Beech Pine wooden', 'خشب زان', 400, '068', 10, false
    ) ON CONFLICT (sku) DO
UPDATE
SET price = EXCLUDED.price,
    stock = EXCLUDED.stock,
    name_ar = EXCLUDED.name_ar,
    description_en = EXCLUDED.description_en,
    description_ar = EXCLUDED.description_ar;