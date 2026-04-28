
    -- Data Row: 041 (Board with Ears)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
        'Board with Ears',
        'لوح  بودان',
        'searving board with 2 cup place',
        'لوح تقديم يحتوي علي اماكن لحمل الاكواب',
        600,
        '041',
        4,
        '46*42',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','glasses','movie nights','gathering']::TEXT[],
        ARRAY['/images/2-Boards/041-Board with Ears/041-Board-with-Ears-01.jpg','/images/2-Boards/041-Board with Ears/041-Board-with-Ears-02.jpg','/images/2-Boards/041-Board with Ears/041-Board with Ears-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 040 (Waves board)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
        'Waves board',
        'لوح مموج',
        'serving board with multi-purposes, for cheese, for sushi or desserts',
        '',
        400,
        '040',
        1,
        '',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','movie nights','gathering']::TEXT[],
        ARRAY['/images/4-serving/040-Waves board/040-Waves-Board-01.jpg','/images/4-serving/040-Waves board/040-Waves-Board-02.jpg','/images/4-serving/040-Waves board/040-Waves-Board-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 039 (Meduim Taco Holder)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
        'Meduim Taco Holder',
        'حامل تاكو متوسط الحجم',
        'Medium-sized taco holder',
        'حامل للتاكو متوسط الحجم',
        260,
        '039',
        1,
        '37*7.5',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','tacos']::TEXT[],
        ARRAY['/images/4-serving/039-Meduim Taco Holder/039-Meduim Taco Holder-01.png','/images/4-serving/039-Meduim Taco Holder/039-Meduim-Taco-Holder-02.jpg','/images/4-serving/039-Meduim Taco Holder/039-Meduim Taco Holder-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 038 (Small Taco Holder)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
        'Small Taco Holder',
        'حامل تاكو صغير الحجم',
        'Mini taco holder',
        'حامل للتاكو صغير',
        180,
        '038',
        4,
        '16*7.5',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','tacos']::TEXT[],
        ARRAY['/images/4-serving/038-Small Taco Holder/038-Small-Taco-Holder-01.jpg','/images/4-serving/038-Small Taco Holder/038-Small-Taco-Holder-02.jpg','/images/4-serving/038-Small Taco Holder/038-Small Taco Holder-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 036 (large Sushi tray)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
        'large Sushi tray',
        'صينيه سوشي كبيره',
        'large Sushi tray',
        'صينيه سوشي كبيره',
        1800,
        '036',
        1,
        '68.5*14.5',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','sushi','gathering','tray']::TEXT[],
        ARRAY['/images/3-trays/036-large Sushi tray/036-large-Sushi-tray-01.jpg','/images/3-trays/036-large Sushi tray/036-large-Sushi-tray-02.jpg','/images/3-trays/036-large Sushi tray/036-large-Sushi-tray-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 035 (Disassembly and assembly board)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'trays' LIMIT 1),
        'Disassembly and assembly board',
        'لوح فك وتركيب',
        'Disassembly and assembly board',
        'لوح فك وتركيب',
        900,
        '035',
        3,
        '69.5*15*25',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','natural wood','cheese board','glasses','sushi','gathering','tray']::TEXT[],
        ARRAY['/images/3-trays/035-Disassembly and assembly board/035-Disassembly-and-assembly-board-01.png','/images/3-trays/035-Disassembly and assembly board/035-Disassembly-and-assembly-board-02.jpg','/images/3-trays/035-Disassembly and assembly board/035-Disassembly-and-assembly-board-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 034 (small Split serving board)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
        'small Split serving board',
        'لوح تقديم مقسم صغير',
        'small divided snack serving tray',
        'لوح لتقديم التسالي مقسم صغير',
        450,
        '034',
        0,
        '24.5*12',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','serving']::TEXT[],
        ARRAY['/images/4-serving/034-Small Split serving board/034-Small-Split-serving-board-01.jpg','/images/4-serving/034-Small Split serving board/034-Small-Split-serving-board-02.jpg','/images/4-serving/034-Small Split serving board/034-Small-Split-serving-board-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 033 (Large Star)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
        'Large Star',
        'نجمه كبيره',
        'A large star-shaped dish',
        'طبق علي شكل نجمه كبير',
        400,
        '033',
        1,
        'large',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','tableware','serving','beech pine','wood plate','serving plate','ramadan','special season','christmas','star','dipping']::TEXT[],
        ARRAY['/images/1-seasons special/033-Large-Star/033-Large-Star-01.png','/images/1-seasons special/033-Large-Star/033-Large-Star-02.jpg','/images/1-seasons special/033-Large-Star/033-Large-Star-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 032 (Small Star)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
        'Small Star',
        'نجمه صغيره',
        'A small star-shaped dish',
        'طبق علي شكل نجمه صغيره',
        300,
        '032',
        1,
        'small',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','tableware','serving','beech pine','wood plate','serving plate','ramadan','special season','christmas','star','dipping']::TEXT[],
        ARRAY['/images/1-seasons special/032-small-Star/032-small-Star-01.jpg','/images/1-seasons special/032-small-Star/032-small-Star-02.jpg','/images/1-seasons special/032-small-Star/032-small-Star-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 030 (Meduim Cutting board with handle)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
        'Meduim Cutting board with handle',
        'لوح تقطيع متوسط ب يد',
        'Medium-sized cutting board with a dark brown handle',
        'لوح تقطيع متوسط ب يد بني غامق',
        550,
        '030',
        0,
        'medium',
        ARRAY['wood','kitchen','tools','engraved','sheesham','wooden','gifts','board','cutting board','natural wood']::TEXT[],
        ARRAY['/images/2-Boards/030-Cutting board /030-Large-Cutting-board-01.jpg','/images/2-Boards/030-Cutting board /030-Large-Cutting-board-02.jpg','/images/2-Boards/030-Cutting board /030-Large-Cutting-board-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 029 (Rectangle dip plate)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
        'Rectangle dip plate',
        'طبق مستطيل عميق',
        'Deep rectangular beechwood dish',
        'طبق مستطيل عميق من خشب البيتش',
        0,
        '029',
        0,
        '',
        ARRAY['wood','kitchen','tools','engraved','beech pine','wooden','gifts','natural wood','tableware','dipping','serving']::TEXT[],
        ARRAY['/images/4-serving/029-Rectangle dip plate/029-Rectangle-dip-plate-01.jpg','/images/4-serving/029-Rectangle dip plate/029-Rectangle-dip-plate-02.jpg','/images/4-serving/029-Rectangle dip plate/029-Rectangle-dip-plate-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 028 (medium cutting board)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
        'medium cutting board',
        'لوح تقطيع متوسط',
        'Medium cutting board',
        'لوح خشبي للتقطيع متوسط',
        675,
        '028',
        1,
        'medium',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','cutting board','natural wood']::TEXT[],
        ARRAY['/images/2-Boards/028-Medium cutting board/028-Medium-Cutting-board-01.jpg','/images/2-Boards/028-Medium cutting board/028-Medium-Cutting-board-02.jpg','/images/2-Boards/028-Medium cutting board/028-Medium-Cutting-board-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 027 (small Cutting Board)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
        'small Cutting Board',
        'لوح تقطيع صغير',
        'small Cutting Board',
        'لوح تقطيع صغير',
        550,
        '027',
        1,
        'small',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','cutting board','natural wood']::TEXT[],
        ARRAY['/images/2-Boards/027-Small cutting board/027-Small-Cutting-board-01.jpg','/images/2-Boards/027-Small cutting board/027-Small-Cutting-board-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 026 (Large Cutting board)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'boards' LIMIT 1),
        'Large Cutting board',
        'لوح تقطيع كبير',
        'Large wooden board for the flock',
        'لوح خشبي للتقطيع مقاس كبير',
        800,
        '026',
        1,
        'large',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','board','cutting board','natural wood']::TEXT[],
        ARRAY['/images/2-Boards/026-Large cutting board/026-large-cutting-board-01.jpg','/images/2-Boards/026-Large cutting board/026-large-cutting-board-02.jpg','/images/2-Boards/026-Large cutting board/026-large-cutting-board-03.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 022 (blocks hot dish holder)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
        'blocks hot dish holder',
        'حامل اطباق ساخنه مكعبات',
        'blocks hot dish holder',
        'حامل اطباق ساخنه مكعبات',
        40,
        '022',
        0,
        '',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','hot dishes']::TEXT[],
        ARRAY['/images/4-serving/022-blocks hot dish holder/022-blocks-hot-dish-holder-01.jpg','/images/4-serving/022-blocks hot dish holder/022-blocks-hot-dish-holder-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 021 (squares hot dish holder)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
        'squares hot dish holder',
        'حامل اطباق ساخنه مربع',
        'squares hot dish holder',
        'حامل اطباق ساخنه مربع',
        40,
        '021',
        0,
        '',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','hot dishes']::TEXT[],
        ARRAY['/images/4-serving/021-squares hot dish holder/021-squares-hot-dish-holder-01.jpg','/images/4-serving/021-squares hot dish holder/021-squares-hot-dish-holder-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 020 (Stand coasters)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
        'Stand coasters',
        'حامل كوستر',
        'Coaster holder',
        'حامل ل حامل الاكواب',
        250,
        '020',
        5,
        '',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','coasters']::TEXT[],
        ARRAY['/images/4-serving/020-Stand coasters/020-Stand-coasters-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 019 (edged coaster)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
        'edged coaster',
        'كوستر بحواف',
        'Cup holder with edges',
        'حامل اكواب بحواف',
        300,
        '019',
        0,
        '',
        ARRAY['wood','kitchen','tools','engraved','beech pine','wooden','gifts','natural wood','tableware','dipping','serving']::TEXT[],
        ARRAY['/images/1-seasons special/019-Edged coaster/019-Edged-coaster-01.jpg','/images/1-seasons special/019-Edged coaster/019-Edged-coaster-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 018 (coffee coaster)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
        'coffee coaster',
        'كوستر للقهوه',
        'Coffee cup holder',
        'حامل اكواب للقهوه',
        300,
        '018',
        0,
        '',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','coasters','tray']::TEXT[],
        ARRAY['/images/1-seasons special/018-Coffee coaster/018-Coffee-coaster-01.jpg','/images/1-seasons special/018-Coffee coaster/018-Coffee-coaster-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 017 (circle coaster)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
        'circle coaster',
        'كوستر دائري',
        'Round cup holder',
        'حامل اكواب بشكل دائري',
        200,
        '017',
        0,
        '',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','coasters']::TEXT[],
        ARRAY['/images/1-seasons special/017-Circle coaster/017-Circle-coaster-01.jpg','/images/1-seasons special/017-Circle coaster/017-Circle-coaster-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 016 (regtangle coaster)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
        'regtangle coaster',
        'كوستر مستطيل',
        'Rectangular cup holder',
        'حامل اكواب مستطيل',
        250,
        '016',
        0,
        '',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood']::TEXT[],
        ARRAY['/images/1-seasons special/016-Rectangle-Coaster/016-Rectangle-Coaster-01.png']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 015 (big heart coaster)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
        'big heart coaster',
        'كوستر قلب كبير',
        'Large heart cup holder',
        'حامل اكواب قلب كبير',
        350,
        '015',
        0,
        '',
        ARRAY['wood','tray','kitchen','tools','engraved','sheesham','wooden','gifts','natural wood','tableware','heart','valentine','special season','valentine','mother''s day']::TEXT[],
        ARRAY['/images/1-seasons special/015-Big Heart coaster/013-3-hearts-coaster-01.jpg','/images/1-seasons special/015-Big Heart coaster/013-3-hearts-coaster-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 014 (2 hearts coaster)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
        '2 hearts coaster',
        '2 كوستر قلب',
        'eart-shaped cup holder with 2 coasters',
        'حامل اكواب علي شكل قلب 2 كوستر',
        250,
        '014',
        0,
        '',
        ARRAY['wood','tray','kitchen','tools','engraved','sheesham','wooden','gifts','natural wood','tableware','heart','valentine','special season','valentine','mother''s day']::TEXT[],
        ARRAY['/images/1-seasons special/012-2 hearts coaster /012-2-hearts-coaster-01.jpg','/images/1-seasons special/012-2 hearts coaster /012-2-hearts-coaster-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 013 (3 hearts coaster)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'seasons' LIMIT 1),
        '3 hearts coaster',
        '3 كوستر قلب',
        'Heart-shaped cup holder with 3 coasters',
        'حامل اكواب علي شكل قلب 3 كوستر',
        300,
        '013',
        0,
        '15*33',
        ARRAY['wood','tray','kitchen','tools','engraved','sheesham','wooden','gifts','natural wood','tableware','heart','valentine','special season','valentine','mother''sday']::TEXT[],
        ARRAY['/images/1-seasons special/013-3 hearts coaster/013-3-hearts-coaster-01.jpg','/images/1-seasons special/013-3 hearts coaster/013-3-hearts-coaster-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;

    -- Data Row: 012 (big coaster)
    INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock, size_en, tags, images)
    VALUES (
        (SELECT id FROM public.categories WHERE slug = 'serving' LIMIT 1),
        'big coaster',
        'كوستر كبير',
        'large cup holder',
        'حامل اكواب كبير',
        60,
        '012',
        0,
        '',
        ARRAY['wood','kitchen','tools','engraved','wooden','gifts','natural wood','hot dishes']::TEXT[],
        ARRAY['/images/4-serving/014-Big Coaster/014-Big-Coaster-01.jpg','/images/4-serving/014-Big Coaster/014-Big Coaster-02.jpg']::TEXT[]
    ) ON CONFLICT (sku) DO NOTHING;