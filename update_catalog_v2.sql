-- Product Catalog Bulk Update (V2) - Fixed SKU Conflicts (Take 3)

DO $$
DECLARE
    bid UUID;
    sid UUID;
    tid UUID;
    nid UUID;
BEGIN
    SELECT id INTO bid FROM public.categories WHERE slug = 'boards' LIMIT 1;
    SELECT id INTO sid FROM public.categories WHERE slug = 'serving' LIMIT 1;
    SELECT id INTO tid FROM public.categories WHERE slug = 'trays' LIMIT 1;
    SELECT id INTO nid FROM public.categories WHERE slug = 'seasons' LIMIT 1;

    -- Phase 1: Temporary SKU renaming to avoid unique constraint violations
    -- This renames any product in the database that has a SKU we are about to use.
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '001';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '002';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '003';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '004';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '006';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '007';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '008';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '009';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '010';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '011';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '012';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '013';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '014';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '015';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '016';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '019';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '020';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '021';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '022';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '023';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '024';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '025';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '026';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '027';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '028';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '029';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '030';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '031';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '032';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '033';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '034';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '035';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '037';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '039';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '041';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '044';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '045';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '046';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '047';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '048';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '049';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '050';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '051';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '051-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '051-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '051-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '052';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '053';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '054';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '054-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '054-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '054-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '054-04';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '055';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '056';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '057';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '058';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '059';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '060';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '060-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '060-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '060-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '060-04';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '061';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '062';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '063-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '063-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '063-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '064-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '064-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '064-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '065';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '066';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '067';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '068';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '069';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '070';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '071';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '072';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '073';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '074';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '075';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '076';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '077';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '078';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '079';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '080';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '081';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '082-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '082-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '082-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '083-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '083-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '083-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '083-04';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '084';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '085';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '086';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '087';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '088';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '089-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '089-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '089-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '089-04';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '090';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '091';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '092';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '093-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '093-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '093-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '093-04';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '094';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '095-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '095-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '095-03';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '096';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '097';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '098';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '099';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '100-01';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '100-02';
    UPDATE public.products SET sku = 'TEMP-' || sku WHERE sku = '100-03';

    -- Phase 2: Actual updates and inserts
    -- Inserting/Updating 100-01
    UPDATE public.products SET sku = '100-01', name_en = 'Set of Bloom Board', name_ar = 'طقم ألواح خشبية منقوش', description_en = 'Set of 2, Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 40cm, 50 cm', description_ar = 'طقم ألواح خشبية منقوش مصنوع من خشب البيتش الطبيعي ، مكون من قطعتين - المقاس: 40cm, 50 cm', price = 600, stock = 2, category_id = tid WHERE sku = 'TEMP-100-01';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'Set of Bloom Board', 'طقم ألواح خشبية منقوش', 'Set of 2, Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 40cm, 50 cm', 'طقم ألواح خشبية منقوش مصنوع من خشب البيتش الطبيعي ، مكون من قطعتين - المقاس: 40cm, 50 cm', 600, '100-01', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 019 (as TEMP-019) to 100-02
    UPDATE public.products SET sku = '100-02', name_en = 'Small Bloom Board', name_ar = 'لوح خشبي صغير منقوش', description_en = 'Small Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 40cm', description_ar = 'لوح خشبي صغيرمنقوش مصنوع من خشب البيتش الطبيعي - المقاس: 40cm', price = 300, stock = 3, category_id = tid WHERE sku = 'TEMP-019';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Small Bloom Board', name_ar = 'لوح خشبي صغير منقوش', description_en = 'Small Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 40cm', description_ar = 'لوح خشبي صغيرمنقوش مصنوع من خشب البيتش الطبيعي - المقاس: 40cm', price = 300, stock = 3, category_id = tid WHERE sku = 'TEMP-100-02';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'Small Bloom Board', 'لوح خشبي صغير منقوش', 'Small Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 40cm', 'لوح خشبي صغيرمنقوش مصنوع من خشب البيتش الطبيعي - المقاس: 40cm', 300, '100-02', 3) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '100-02' WHERE sku = 'TEMP-100-02';
        END IF;
    END IF;

    -- Inserting/Updating 100-03
    UPDATE public.products SET sku = '100-03', name_en = 'Large Bloom Board', name_ar = 'لوح خشبي كبير منقوش', description_en = 'Large Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 50 cm', description_ar = 'لوح خشبي كبير مصنوع من خشب البيتش الطبيعي - المقاس: 50 cm', price = 350, stock = 2, category_id = tid WHERE sku = 'TEMP-100-03';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'Large Bloom Board', 'لوح خشبي كبير منقوش', 'Large Bloom Board Crafted from natural beech pine wood with an engraved floral detail - Size: 50 cm', 'لوح خشبي كبير مصنوع من خشب البيتش الطبيعي - المقاس: 50 cm', 350, '100-03', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 099
    UPDATE public.products SET sku = '099', name_en = 'Deep Cheese Board', name_ar = 'لوح خشبي كبير محفور', description_en = 'Deep Large cheese board, crafted from Beech Pine - Size: 50 cm', description_ar = 'لوح جبن كبير محفور من خشب البيتش – عميق - المقاس: 50 cm', price = 400, stock = 1, category_id = tid WHERE sku = 'TEMP-099';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'Deep Cheese Board', 'لوح خشبي كبير محفور', 'Deep Large cheese board, crafted from Beech Pine - Size: 50 cm', 'لوح جبن كبير محفور من خشب البيتش – عميق - المقاس: 50 cm', 400, '099', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 020 (as TEMP-020) to 098
    UPDATE public.products SET sku = '098', name_en = 'Flat Cheese Board', name_ar = 'لوح خشبي كبير مسطح', description_en = 'Flat Large cheese board, crafted from Beech Pine - Size: 50cm', description_ar = 'لوح جبن كبير مسطح من خشب البيتش - المقاس: 50cm', price = 350, stock = 1, category_id = tid WHERE sku = 'TEMP-020';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Flat Cheese Board', name_ar = 'لوح خشبي كبير مسطح', description_en = 'Flat Large cheese board, crafted from Beech Pine - Size: 50cm', description_ar = 'لوح جبن كبير مسطح من خشب البيتش - المقاس: 50cm', price = 350, stock = 1, category_id = tid WHERE sku = 'TEMP-098';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'Flat Cheese Board', 'لوح خشبي كبير مسطح', 'Flat Large cheese board, crafted from Beech Pine - Size: 50cm', 'لوح جبن كبير مسطح من خشب البيتش - المقاس: 50cm', 350, '098', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '098' WHERE sku = 'TEMP-098';
        END IF;
    END IF;

    -- Updating 021 (as TEMP-021) to 097
    UPDATE public.products SET sku = '097', name_en = 'Sheesham cutting board', name_ar = 'لوح تقطيع', description_en = 'Small sheesham Wooden cutting board - Size: 40 * 20', description_ar = 'لوح تقطيع صغير مصنوع خشب السرسوع - المقاس: 40 * 20', price = 600, stock = 3, category_id = bid WHERE sku = 'TEMP-021';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Sheesham cutting board', name_ar = 'لوح تقطيع', description_en = 'Small sheesham Wooden cutting board - Size: 40 * 20', description_ar = 'لوح تقطيع صغير مصنوع خشب السرسوع - المقاس: 40 * 20', price = 600, stock = 3, category_id = bid WHERE sku = 'TEMP-097';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Sheesham cutting board', 'لوح تقطيع', 'Small sheesham Wooden cutting board - Size: 40 * 20', 'لوح تقطيع صغير مصنوع خشب السرسوع - المقاس: 40 * 20', 600, '097', 3) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '097' WHERE sku = 'TEMP-097';
        END IF;
    END IF;

    -- Updating 022 (as TEMP-022) to 096
    UPDATE public.products SET sku = '096', name_en = 'Sheesham cutting board', name_ar = 'لوح تقطيع', description_en = 'Large sheesham Wooden cutting board - Size: 52 *17', description_ar = 'لوح تقطيع كبير مصنوع خشب السرسوع - المقاس: 52 *17', price = 650, stock = 4, category_id = bid WHERE sku = 'TEMP-022';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Sheesham cutting board', name_ar = 'لوح تقطيع', description_en = 'Large sheesham Wooden cutting board - Size: 52 *17', description_ar = 'لوح تقطيع كبير مصنوع خشب السرسوع - المقاس: 52 *17', price = 650, stock = 4, category_id = bid WHERE sku = 'TEMP-096';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Sheesham cutting board', 'لوح تقطيع', 'Large sheesham Wooden cutting board - Size: 52 *17', 'لوح تقطيع كبير مصنوع خشب السرسوع - المقاس: 52 *17', 650, '096', 4) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '096' WHERE sku = 'TEMP-096';
        END IF;
    END IF;

    -- Updating 023 (as TEMP-023) to 095-01
    UPDATE public.products SET sku = '095-01', name_en = 'Puzzle Board Set', name_ar = 'طقم ألواح بازل', description_en = 'mix sheesham - Beech Pine Wood Puzzle Cheese Board, 2 pieces - Size: 40cm & 50 cm', description_ar = 'طقم ألواح بازل مصنوعه من خشب السرسوع و البيتش باين، مكون من قطعتين - المقاس: 40cm & 50 cm', price = 800, stock = 5, category_id = bid WHERE sku = 'TEMP-023';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Puzzle Board Set', name_ar = 'طقم ألواح بازل', description_en = 'mix sheesham - Beech Pine Wood Puzzle Cheese Board, 2 pieces - Size: 40cm & 50 cm', description_ar = 'طقم ألواح بازل مصنوعه من خشب السرسوع و البيتش باين، مكون من قطعتين - المقاس: 40cm & 50 cm', price = 800, stock = 5, category_id = bid WHERE sku = 'TEMP-095-01';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Puzzle Board Set', 'طقم ألواح بازل', 'mix sheesham - Beech Pine Wood Puzzle Cheese Board, 2 pieces - Size: 40cm & 50 cm', 'طقم ألواح بازل مصنوعه من خشب السرسوع و البيتش باين، مكون من قطعتين - المقاس: 40cm & 50 cm', 800, '095-01', 5) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '095-01' WHERE sku = 'TEMP-095-01';
        END IF;
    END IF;

    -- Inserting/Updating 095-02
    UPDATE public.products SET sku = '095-02', name_en = 'Small Puzzle Board', name_ar = 'لوح بازل صغير', description_en = 'mix sheesham - Beech Pine Wood Puzzle Cheese Board - Size: 40cm', description_ar = 'لوح بازل صغير مصنوع من خشب السرسوع و البيتش باين - المقاس: 40cm', price = 400, stock = 5, category_id = bid WHERE sku = 'TEMP-095-02';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Small Puzzle Board', 'لوح بازل صغير', 'mix sheesham - Beech Pine Wood Puzzle Cheese Board - Size: 40cm', 'لوح بازل صغير مصنوع من خشب السرسوع و البيتش باين - المقاس: 40cm', 400, '095-02', 5) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 095-03
    UPDATE public.products SET sku = '095-03', name_en = 'Large Puzzle Board', name_ar = 'لوح بازل كبير', description_en = 'mix sheesham - Beech Pine Wood Puzzle Cheese Board - Size: 50sm', description_ar = 'لوح بازل كبير مصنوع من خشب السرسوع و البيتش باين - المقاس: 50sm', price = 500, stock = 5, category_id = bid WHERE sku = 'TEMP-095-03';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Large Puzzle Board', 'لوح بازل كبير', 'mix sheesham - Beech Pine Wood Puzzle Cheese Board - Size: 50sm', 'لوح بازل كبير مصنوع من خشب السرسوع و البيتش باين - المقاس: 50sm', 500, '095-03', 5) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 030 (as TEMP-030) to 094
    UPDATE public.products SET sku = '094', name_en = 'Wooden tray with handle', name_ar = 'صينية خشب بيد', description_en = 'sheesham Wooden Tray with black handle - Size: 47*31', description_ar = 'صنيه تقديم مصنوعه من خشب السرسوع بأيدى سوداء - المقاس: 47*31', price = 950, stock = 2, category_id = tid WHERE sku = 'TEMP-030';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Wooden tray with handle', name_ar = 'صينية خشب بيد', description_en = 'sheesham Wooden Tray with black handle - Size: 47*31', description_ar = 'صنيه تقديم مصنوعه من خشب السرسوع بأيدى سوداء - المقاس: 47*31', price = 950, stock = 2, category_id = tid WHERE sku = 'TEMP-094';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'Wooden tray with handle', 'صينية خشب بيد', 'sheesham Wooden Tray with black handle - Size: 47*31', 'صنيه تقديم مصنوعه من خشب السرسوع بأيدى سوداء - المقاس: 47*31', 950, '094', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '094' WHERE sku = 'TEMP-094';
        END IF;
    END IF;

    -- Updating 031 (as TEMP-031) to 093-01
    UPDATE public.products SET sku = '093-01', name_en = 'Set of wooden tray with wood handle', name_ar = 'طقم صواني خشب بيد خشبية', description_en = 'Set of 3 wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 43*20, 48*25, 53*29', description_ar = 'صوانى تقديم مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه ، ٣ صواني - المقاس: 43*20, 48*25, 53*29', price = 2000, stock = 2, category_id = tid WHERE sku = 'TEMP-031';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Set of wooden tray with wood handle', name_ar = 'طقم صواني خشب بيد خشبية', description_en = 'Set of 3 wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 43*20, 48*25, 53*29', description_ar = 'صوانى تقديم مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه ، ٣ صواني - المقاس: 43*20, 48*25, 53*29', price = 2000, stock = 2, category_id = tid WHERE sku = 'TEMP-093-01';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'Set of wooden tray with wood handle', 'طقم صواني خشب بيد خشبية', 'Set of 3 wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 43*20, 48*25, 53*29', 'صوانى تقديم مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه ، ٣ صواني - المقاس: 43*20, 48*25, 53*29', 2000, '093-01', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '093-01' WHERE sku = 'TEMP-093-01';
        END IF;
    END IF;

    -- Inserting/Updating 093-02
    UPDATE public.products SET sku = '093-02', name_en = 'large wooden tray with wood handle', name_ar = 'صنيه صغيرة خشب بيد خشبية', description_en = 'Large wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 43*20', description_ar = 'صنية تقديم صغيرة مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه - المقاس: 43*20', price = 850, stock = 2, category_id = tid WHERE sku = 'TEMP-093-02';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'large wooden tray with wood handle', 'صنيه صغيرة خشب بيد خشبية', 'Large wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 43*20', 'صنية تقديم صغيرة مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه - المقاس: 43*20', 850, '093-02', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 093-03
    UPDATE public.products SET sku = '093-03', name_en = 'meduim wooden tray with wood handle', name_ar = 'صنيه وسط خشب بيد خشبية', description_en = 'Meduim wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 48*25', description_ar = 'صنية تقديم وسط مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه - المقاس: 48*25', price = 750, stock = 2, category_id = tid WHERE sku = 'TEMP-093-03';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'meduim wooden tray with wood handle', 'صنيه وسط خشب بيد خشبية', 'Meduim wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 48*25', 'صنية تقديم وسط مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه - المقاس: 48*25', 750, '093-03', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 093-04
    UPDATE public.products SET sku = '093-04', name_en = 'small wooden tray with wood handle', name_ar = 'صنيه كبيرة خشب بيد خشبية', description_en = 'Small wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 53*29', description_ar = 'صنية تقديم كبيرة مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه - المقاس: 53*29', price = 650, stock = 2, category_id = tid WHERE sku = 'TEMP-093-04';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'small wooden tray with wood handle', 'صنيه كبيرة خشب بيد خشبية', 'Small wooden Rectangular traies with 2 wood handles, made of Beech Pine - Size: 53*29', 'صنية تقديم كبيرة مصنوعه من خشب البيتش باين بأيدى خشبية جانبيه - المقاس: 53*29', 650, '093-04', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 032 (as TEMP-032) to 092
    UPDATE public.products SET sku = '092', name_en = 'The Grill', name_ar = 'شوايه', description_en = 'Beech pine wood grill, detachable and assembleable - Size: 26*50', description_ar = 'شواية خشب بيتش باين قابلة للفك والتركيب - المقاس: 26*50', price = 1000, stock = 5, category_id = tid WHERE sku = 'TEMP-032';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'The Grill', name_ar = 'شوايه', description_en = 'Beech pine wood grill, detachable and assembleable - Size: 26*50', description_ar = 'شواية خشب بيتش باين قابلة للفك والتركيب - المقاس: 26*50', price = 1000, stock = 5, category_id = tid WHERE sku = 'TEMP-092';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (tid, 'The Grill', 'شوايه', 'Beech pine wood grill, detachable and assembleable - Size: 26*50', 'شواية خشب بيتش باين قابلة للفك والتركيب - المقاس: 26*50', 1000, '092', 5) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '092' WHERE sku = 'TEMP-092';
        END IF;
    END IF;

    -- Updating 002 (as TEMP-002) to 091
    UPDATE public.products SET sku = '091', name_en = 'Large Bowl', name_ar = 'طبق كايا كبير', description_en = 'Kaia wooden crafted big bowl - Size: 37-40cm', description_ar = 'طبق كايا خشب كبير - المقاس: 37-40cm', price = 850, stock = 6, category_id = sid WHERE sku = 'TEMP-002';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Large Bowl', name_ar = 'طبق كايا كبير', description_en = 'Kaia wooden crafted big bowl - Size: 37-40cm', description_ar = 'طبق كايا خشب كبير - المقاس: 37-40cm', price = 850, stock = 6, category_id = sid WHERE sku = 'TEMP-091';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Large Bowl', 'طبق كايا كبير', 'Kaia wooden crafted big bowl - Size: 37-40cm', 'طبق كايا خشب كبير - المقاس: 37-40cm', 850, '091', 6) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '091' WHERE sku = 'TEMP-091';
        END IF;
    END IF;

    -- Inserting/Updating 090
    UPDATE public.products SET sku = '090', name_en = 'Meduim Bowl', name_ar = 'طبق كايا وسط', description_en = 'Kaia wooden crafted big bowl - Size: 33-35', description_ar = 'طبق كايا خشب وسط - المقاس: 33-35', price = 700, stock = 5, category_id = sid WHERE sku = 'TEMP-090';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Meduim Bowl', 'طبق كايا وسط', 'Kaia wooden crafted big bowl - Size: 33-35', 'طبق كايا خشب وسط - المقاس: 33-35', 700, '090', 5) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 003 (as TEMP-003) to 089-04
    UPDATE public.products SET sku = '089-04', name_en = 'Small Deep Bowl', name_ar = 'طبق كايا عميق صغير', description_en = 'Small Kaia wooden deep bowl - Size: 25* 13', description_ar = 'طبق عميق خشب كايا - المقاس: 25* 13', price = 600, stock = 10, category_id = sid WHERE sku = 'TEMP-003';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Small Deep Bowl', name_ar = 'طبق كايا عميق صغير', description_en = 'Small Kaia wooden deep bowl - Size: 25* 13', description_ar = 'طبق عميق خشب كايا - المقاس: 25* 13', price = 600, stock = 10, category_id = sid WHERE sku = 'TEMP-089-04';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Small Deep Bowl', 'طبق كايا عميق صغير', 'Small Kaia wooden deep bowl - Size: 25* 13', 'طبق عميق خشب كايا - المقاس: 25* 13', 600, '089-04', 10) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '089-04' WHERE sku = 'TEMP-089-04';
        END IF;
    END IF;

    -- Inserting/Updating 089-03
    UPDATE public.products SET sku = '089-03', name_en = 'Meduim Deep Bowl', name_ar = 'طبق كايا عميق وسط', description_en = 'Meduim Kaia wooden deep bowl - Size: 32*11', description_ar = 'طبق عميق خشب كايا - المقاس: 32*11', price = 700, stock = 1, category_id = sid WHERE sku = 'TEMP-089-03';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Meduim Deep Bowl', 'طبق كايا عميق وسط', 'Meduim Kaia wooden deep bowl - Size: 32*11', 'طبق عميق خشب كايا - المقاس: 32*11', 700, '089-03', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 089-02
    UPDATE public.products SET sku = '089-02', name_en = 'Large Deep Bowl', name_ar = 'طبق كايا عميق كبير', description_en = 'Large Kaia wooden deep bowl - Size: 28*12', description_ar = 'طبق عميق خشب كايا - المقاس: 28*12', price = 800, stock = 1, category_id = sid WHERE sku = 'TEMP-089-02';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Large Deep Bowl', 'طبق كايا عميق كبير', 'Large Kaia wooden deep bowl - Size: 28*12', 'طبق عميق خشب كايا - المقاس: 28*12', 800, '089-02', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 089-01
    UPDATE public.products SET sku = '089-01', name_en = 'Set of Deep Bowls', name_ar = 'طقم اطباق كايا عميق', description_en = 'Set of 3 Kaia wooden deep bowls - Size: 25*13, 32*11, 28*12', description_ar = 'طقم اطباق كايا عميق ، ٣ اطباق - المقاس: 25*13, 32*11, 28*12', price = 2000, stock = 1, category_id = sid WHERE sku = 'TEMP-089-01';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Set of Deep Bowls', 'طقم اطباق كايا عميق', 'Set of 3 Kaia wooden deep bowls - Size: 25*13, 32*11, 28*12', 'طقم اطباق كايا عميق ، ٣ اطباق - المقاس: 25*13, 32*11, 28*12', 2000, '089-01', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 088
    UPDATE public.products SET sku = '088', name_en = 'Small Bowl', name_ar = 'طبق عميق صغير', description_en = 'Small sheesham wooden bowl - Size: 16cm', description_ar = 'طبق عميق صغير مصنوع من خشب سرسوع - المقاس: 16cm', price = 300, stock = 12, category_id = sid WHERE sku = 'TEMP-088';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Small Bowl', 'طبق عميق صغير', 'Small sheesham wooden bowl - Size: 16cm', 'طبق عميق صغير مصنوع من خشب سرسوع - المقاس: 16cm', 300, '088', 12) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 087
    UPDATE public.products SET sku = '087', name_en = 'Meduim Bowl', name_ar = 'طبق عميق وسط', description_en = 'Meduim sheesham wooden bowl - Size: 19cm', description_ar = 'طبق عميق وسط مصنوع من خشب سرسوع - المقاس: 19cm', price = 350, stock = 7, category_id = sid WHERE sku = 'TEMP-087';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Meduim Bowl', 'طبق عميق وسط', 'Meduim sheesham wooden bowl - Size: 19cm', 'طبق عميق وسط مصنوع من خشب سرسوع - المقاس: 19cm', 350, '087', 7) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 004 (as TEMP-004) to 086
    UPDATE public.products SET sku = '086', name_en = 'Large Bowl', name_ar = 'طبق عميق كبير', description_en = 'Large sheesham wooden bowl - Size: 22cm', description_ar = 'طبق عميق كبير مصنوع من خشب سرسوع - المقاس: 22cm', price = 400, stock = 19, category_id = sid WHERE sku = 'TEMP-004';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Large Bowl', name_ar = 'طبق عميق كبير', description_en = 'Large sheesham wooden bowl - Size: 22cm', description_ar = 'طبق عميق كبير مصنوع من خشب سرسوع - المقاس: 22cm', price = 400, stock = 19, category_id = sid WHERE sku = 'TEMP-086';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Large Bowl', 'طبق عميق كبير', 'Large sheesham wooden bowl - Size: 22cm', 'طبق عميق كبير مصنوع من خشب سرسوع - المقاس: 22cm', 400, '086', 19) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '086' WHERE sku = 'TEMP-086';
        END IF;
    END IF;

    -- Inserting/Updating 085
    UPDATE public.products SET sku = '085', name_en = 'X-Large Bowl', name_ar = 'طبق عميق كبير', description_en = 'X-Large sheesham wooden bowl - Size: 27cm', description_ar = 'طبق عميق كبير مصنوع من خشب سرسوع - المقاس: 27cm', price = 450, stock = 2, category_id = sid WHERE sku = 'TEMP-085';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'X-Large Bowl', 'طبق عميق كبير', 'X-Large sheesham wooden bowl - Size: 27cm', 'طبق عميق كبير مصنوع من خشب سرسوع - المقاس: 27cm', 450, '085', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 006 (as TEMP-006) to 084
    UPDATE public.products SET sku = '084', name_en = 'Sheesham Plate', name_ar = 'طبق صغير', description_en = 'sheesham wooden plate - Size: 16cm', description_ar = 'طبق صغير خشب سرسوع - المقاس: 16cm', price = 450, stock = 1, category_id = sid WHERE sku = 'TEMP-006';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Sheesham Plate', name_ar = 'طبق صغير', description_en = 'sheesham wooden plate - Size: 16cm', description_ar = 'طبق صغير خشب سرسوع - المقاس: 16cm', price = 450, stock = 1, category_id = sid WHERE sku = 'TEMP-084';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Sheesham Plate', 'طبق صغير', 'sheesham wooden plate - Size: 16cm', 'طبق صغير خشب سرسوع - المقاس: 16cm', 450, '084', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '084' WHERE sku = 'TEMP-084';
        END IF;
    END IF;

    -- Updating 009 (as TEMP-009) to 083-01
    UPDATE public.products SET sku = '083-01', name_en = 'Set of Rectangle Plates', name_ar = 'طقم أطباق مستطيلة', description_en = 'Set of 3 rectangle sheesham wooden plates', description_ar = 'طقم اطباق مستطيله مصنوع من خشب السرسوع ، طقم مكون من ٣ قطع', price = 1100, stock = 2, category_id = sid WHERE sku = 'TEMP-009';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Set of Rectangle Plates', name_ar = 'طقم أطباق مستطيلة', description_en = 'Set of 3 rectangle sheesham wooden plates', description_ar = 'طقم اطباق مستطيله مصنوع من خشب السرسوع ، طقم مكون من ٣ قطع', price = 1100, stock = 2, category_id = sid WHERE sku = 'TEMP-083-01';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Set of Rectangle Plates', 'طقم أطباق مستطيلة', 'Set of 3 rectangle sheesham wooden plates', 'طقم اطباق مستطيله مصنوع من خشب السرسوع ، طقم مكون من ٣ قطع', 1100, '083-01', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '083-01' WHERE sku = 'TEMP-083-01';
        END IF;
    END IF;

    -- Inserting/Updating 083-02
    UPDATE public.products SET sku = '083-02', name_en = 'Small Rectangle Plates', name_ar = 'طبق مستطيل صغير', description_en = 'Small rectangle sheesham wooden plates - Size: small', description_ar = 'طبق مستطيل صغير مصنوع من خشب السرسوع - المقاس: small', price = 350, stock = 4, category_id = sid WHERE sku = 'TEMP-083-02';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Small Rectangle Plates', 'طبق مستطيل صغير', 'Small rectangle sheesham wooden plates - Size: small', 'طبق مستطيل صغير مصنوع من خشب السرسوع - المقاس: small', 350, '083-02', 4) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 083-03
    UPDATE public.products SET sku = '083-03', name_en = 'Meduim Rectangle Plates', name_ar = 'طبق مستطيل وسط', description_en = 'Meduim rectangle sheesham wooden plates - Size: meduim', description_ar = 'طبق مستطيل وسط مصنوع من خشب السرسوع - المقاس: meduim', price = 400, stock = 2, category_id = sid WHERE sku = 'TEMP-083-03';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Meduim Rectangle Plates', 'طبق مستطيل وسط', 'Meduim rectangle sheesham wooden plates - Size: meduim', 'طبق مستطيل وسط مصنوع من خشب السرسوع - المقاس: meduim', 400, '083-03', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 083-04
    UPDATE public.products SET sku = '083-04', name_en = 'Large Rectangle Plates', name_ar = 'طبق مستطيل كبير', description_en = 'Large rectangle sheesham wooden plates - Size: large', description_ar = 'طبق مستطيل كبير مصنوع من خشب السرسوع - المقاس: large', price = 450, stock = 6, category_id = sid WHERE sku = 'TEMP-083-04';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Large Rectangle Plates', 'طبق مستطيل كبير', 'Large rectangle sheesham wooden plates - Size: large', 'طبق مستطيل كبير مصنوع من خشب السرسوع - المقاس: large', 450, '083-04', 6) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 010 (as TEMP-010) to 082-01
    UPDATE public.products SET sku = '082-01', name_en = 'Set of wood food warmer', name_ar = 'طقم سخان طعام خشبي', description_en = 'Set of 2 wood food warmers', description_ar = 'طقم من قطعتين، سخان طعام خشبي', price = 700, stock = 7, category_id = sid WHERE sku = 'TEMP-010';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Set of wood food warmer', name_ar = 'طقم سخان طعام خشبي', description_en = 'Set of 2 wood food warmers', description_ar = 'طقم من قطعتين، سخان طعام خشبي', price = 700, stock = 7, category_id = sid WHERE sku = 'TEMP-082-01';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Set of wood food warmer', 'طقم سخان طعام خشبي', 'Set of 2 wood food warmers', 'طقم من قطعتين، سخان طعام خشبي', 700, '082-01', 7) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '082-01' WHERE sku = 'TEMP-082-01';
        END IF;
    END IF;

    -- Inserting/Updating 082-02
    UPDATE public.products SET sku = '082-02', name_en = 'Large wood food warmer', name_ar = 'سخان طعام خشبي كبير', description_en = 'Large wood food warmer with 2 candle places - Size: large', description_ar = 'مدفأة طعام خشبية كبيرة مزودة بمكانين للشموع - المقاس: large', price = 450, stock = 7, category_id = sid WHERE sku = 'TEMP-082-02';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Large wood food warmer', 'سخان طعام خشبي كبير', 'Large wood food warmer with 2 candle places - Size: large', 'مدفأة طعام خشبية كبيرة مزودة بمكانين للشموع - المقاس: large', 450, '082-02', 7) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 082-03
    UPDATE public.products SET sku = '082-03', name_en = 'Small wood food warmer', name_ar = 'سخان طعام خشبي صغير', description_en = 'Small wood food warmer with 1 candle - Size: small', description_ar = 'مدفأة طعام خشبية صغيرة مزودة بمكان لشمعة - المقاس: small', price = 350, stock = 17, category_id = sid WHERE sku = 'TEMP-082-03';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Small wood food warmer', 'سخان طعام خشبي صغير', 'Small wood food warmer with 1 candle - Size: small', 'مدفأة طعام خشبية صغيرة مزودة بمكان لشمعة - المقاس: small', 350, '082-03', 17) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 011 (as TEMP-011) to 081
    UPDATE public.products SET sku = '081', name_en = 'Mini oval dipping plate', name_ar = 'طبق غمس بيضاوي صغير', description_en = 'Mini Beech Pine Wood Dipping Sauce Plates, Set of 3', description_ar = 'طقم اطباق غمس بيضاوي صغير مصنوع من خشب البيتش باين، مكون من ٣ اطباق', price = 100, stock = 2, category_id = sid WHERE sku = 'TEMP-011';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Mini oval dipping plate', name_ar = 'طبق غمس بيضاوي صغير', description_en = 'Mini Beech Pine Wood Dipping Sauce Plates, Set of 3', description_ar = 'طقم اطباق غمس بيضاوي صغير مصنوع من خشب البيتش باين، مكون من ٣ اطباق', price = 100, stock = 2, category_id = sid WHERE sku = 'TEMP-081';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Mini oval dipping plate', 'طبق غمس بيضاوي صغير', 'Mini Beech Pine Wood Dipping Sauce Plates, Set of 3', 'طقم اطباق غمس بيضاوي صغير مصنوع من خشب البيتش باين، مكون من ٣ اطباق', 100, '081', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '081' WHERE sku = 'TEMP-081';
        END IF;
    END IF;

    -- Updating 012 (as TEMP-012) to 080
    UPDATE public.products SET sku = '080', name_en = 'Oval dipping plate', name_ar = 'طبق غمس بيضاوي', description_en = 'Oval Beech Pine Wood Dipping Sauce Plates, Set of 3', description_ar = 'طقم اطباق غمس بيضاوي مصنوع من خشب البيتش باين، مكون من ٣ اطباق', price = 100, stock = 2, category_id = sid WHERE sku = 'TEMP-012';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Oval dipping plate', name_ar = 'طبق غمس بيضاوي', description_en = 'Oval Beech Pine Wood Dipping Sauce Plates, Set of 3', description_ar = 'طقم اطباق غمس بيضاوي مصنوع من خشب البيتش باين، مكون من ٣ اطباق', price = 100, stock = 2, category_id = sid WHERE sku = 'TEMP-080';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Oval dipping plate', 'طبق غمس بيضاوي', 'Oval Beech Pine Wood Dipping Sauce Plates, Set of 3', 'طقم اطباق غمس بيضاوي مصنوع من خشب البيتش باين، مكون من ٣ اطباق', 100, '080', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '080' WHERE sku = 'TEMP-080';
        END IF;
    END IF;

    -- Updating 013 (as TEMP-013) to 079
    UPDATE public.products SET sku = '079', name_en = 'Fish Napkin', name_ar = 'حامل مناديل سمكه', description_en = 'Fish-Shaped Table Napkins', description_ar = 'حامل مناديل خشب على شكل سمكه', price = 400, stock = 31, category_id = sid WHERE sku = 'TEMP-013';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Fish Napkin', name_ar = 'حامل مناديل سمكه', description_en = 'Fish-Shaped Table Napkins', description_ar = 'حامل مناديل خشب على شكل سمكه', price = 400, stock = 31, category_id = sid WHERE sku = 'TEMP-079';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Fish Napkin', 'حامل مناديل سمكه', 'Fish-Shaped Table Napkins', 'حامل مناديل خشب على شكل سمكه', 400, '079', 31) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '079' WHERE sku = 'TEMP-079';
        END IF;
    END IF;

    -- Updating 014 (as TEMP-014) to 078
    UPDATE public.products SET sku = '078', name_en = 'Oval Deep Plate with legs', name_ar = 'طبق بيضاوى عميق بارجل', description_en = 'oval Beech Pine Wood Plate with legs with an engraved floral detail - Size: 9* 25', description_ar = 'طبق بيضاوي الشكل من خشب البيتش باين، مزود بأرجل ونقوش محفورة. - المقاس: 9* 25', price = 350, stock = 1, category_id = sid WHERE sku = 'TEMP-014';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Oval Deep Plate with legs', name_ar = 'طبق بيضاوى عميق بارجل', description_en = 'oval Beech Pine Wood Plate with legs with an engraved floral detail - Size: 9* 25', description_ar = 'طبق بيضاوي الشكل من خشب البيتش باين، مزود بأرجل ونقوش محفورة. - المقاس: 9* 25', price = 350, stock = 1, category_id = sid WHERE sku = 'TEMP-078';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Oval Deep Plate with legs', 'طبق بيضاوى عميق بارجل', 'oval Beech Pine Wood Plate with legs with an engraved floral detail - Size: 9* 25', 'طبق بيضاوي الشكل من خشب البيتش باين، مزود بأرجل ونقوش محفورة. - المقاس: 9* 25', 350, '078', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '078' WHERE sku = 'TEMP-078';
        END IF;
    END IF;

    -- Inserting/Updating 077
    UPDATE public.products SET sku = '077', name_en = 'Oval Deep Plate', name_ar = 'طبق بيضاوى عميق بارجل', description_en = 'oval Beech Pine Wood Plate - Size: 9* 25', description_ar = 'طبق بيضاوي الشكل من خشب البيتش باين - المقاس: 9* 25', price = 300, stock = 2, category_id = sid WHERE sku = 'TEMP-077';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Oval Deep Plate', 'طبق بيضاوى عميق بارجل', 'oval Beech Pine Wood Plate - Size: 9* 25', 'طبق بيضاوي الشكل من خشب البيتش باين - المقاس: 9* 25', 300, '077', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 015 (as TEMP-015) to 076
    UPDATE public.products SET sku = '076', name_en = 'Square Plate', name_ar = 'طبق مربع', description_en = 'Square Beech Pine Wood Plate - Size: 20cm', description_ar = 'طبق مربع عميق مصنوع من خشب البيتش باين - المقاس: 20cm', price = 400, stock = 2, category_id = sid WHERE sku = 'TEMP-015';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Square Plate', name_ar = 'طبق مربع', description_en = 'Square Beech Pine Wood Plate - Size: 20cm', description_ar = 'طبق مربع عميق مصنوع من خشب البيتش باين - المقاس: 20cm', price = 400, stock = 2, category_id = sid WHERE sku = 'TEMP-076';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Square Plate', 'طبق مربع', 'Square Beech Pine Wood Plate - Size: 20cm', 'طبق مربع عميق مصنوع من خشب البيتش باين - المقاس: 20cm', 400, '076', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '076' WHERE sku = 'TEMP-076';
        END IF;
    END IF;

    -- Updating 016 (as TEMP-016) to 075
    UPDATE public.products SET sku = '075', name_en = 'Oval Plate', name_ar = 'طبق بيضاوى', description_en = 'Oval Beech Pine Wood Plate - Size: 14* 30', description_ar = 'طبق بيضاوى مصنوع من خشب البيتش باين - المقاس: 14* 30', price = 500, stock = 10, category_id = sid WHERE sku = 'TEMP-016';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Oval Plate', name_ar = 'طبق بيضاوى', description_en = 'Oval Beech Pine Wood Plate - Size: 14* 30', description_ar = 'طبق بيضاوى مصنوع من خشب البيتش باين - المقاس: 14* 30', price = 500, stock = 10, category_id = sid WHERE sku = 'TEMP-075';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Oval Plate', 'طبق بيضاوى', 'Oval Beech Pine Wood Plate - Size: 14* 30', 'طبق بيضاوى مصنوع من خشب البيتش باين - المقاس: 14* 30', 500, '075', 10) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '075' WHERE sku = 'TEMP-075';
        END IF;
    END IF;

    -- Inserting/Updating 074
    UPDATE public.products SET sku = '074', name_en = 'Small Coaster with candle', name_ar = 'قاعدة أكواب صغيرة خشبية مع مكان لشمعة', description_en = 'Small wooden coaster with a candle holder, made of sheesham - Size: small', description_ar = 'قاعدة أكواب صغيرة خشبية مع مكان لشمعة مصنوعة من خشب السرسوع - المقاس: small', price = 300, stock = 5, category_id = sid WHERE sku = 'TEMP-074';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Small Coaster with candle', 'قاعدة أكواب صغيرة خشبية مع مكان لشمعة', 'Small wooden coaster with a candle holder, made of sheesham - Size: small', 'قاعدة أكواب صغيرة خشبية مع مكان لشمعة مصنوعة من خشب السرسوع - المقاس: small', 300, '074', 5) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 073
    UPDATE public.products SET sku = '073', name_en = 'Meduim Coaster with candle', name_ar = 'قاعدة أكواب وسط خشبية مع مكان لشمعة', description_en = 'Meduim wooden coaster with a candle holder, made of sheesham - Size: meduim', description_ar = 'قاعدة أكواب وسط خشبية مع مكان لشمعة مصنوعة من خشب السرسوع - المقاس: meduim', price = 350, stock = 18, category_id = sid WHERE sku = 'TEMP-073';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Meduim Coaster with candle', 'قاعدة أكواب وسط خشبية مع مكان لشمعة', 'Meduim wooden coaster with a candle holder, made of sheesham - Size: meduim', 'قاعدة أكواب وسط خشبية مع مكان لشمعة مصنوعة من خشب السرسوع - المقاس: meduim', 350, '073', 18) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 072
    UPDATE public.products SET sku = '072', name_en = 'Large Coaster with candle', name_ar = 'قاعدة أكواب كبير خشبية مع مكان لشمعة', description_en = 'Large wooden coaster with a candle holder, made of sheesham - Size: large', description_ar = 'قاعدة أكواب كبير خشبية مع مكان لشمعة مصنوعة من خشب السرسوع - المقاس: large', price = 400, stock = 3, category_id = sid WHERE sku = 'TEMP-072';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Large Coaster with candle', 'قاعدة أكواب كبير خشبية مع مكان لشمعة', 'Large wooden coaster with a candle holder, made of sheesham - Size: large', 'قاعدة أكواب كبير خشبية مع مكان لشمعة مصنوعة من خشب السرسوع - المقاس: large', 400, '072', 3) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 027 (as TEMP-027) to 071
    UPDATE public.products SET sku = '071', name_en = 'Toilet tissue holder', name_ar = 'حامل مناديل للحمام', description_en = 'Wooden Toilet paper holder - Size: 45cm', description_ar = 'حامل منايل للحمام خشب - المقاس: 45cm', price = 450, stock = 10, category_id = sid WHERE sku = 'TEMP-027';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Toilet tissue holder', name_ar = 'حامل مناديل للحمام', description_en = 'Wooden Toilet paper holder - Size: 45cm', description_ar = 'حامل منايل للحمام خشب - المقاس: 45cm', price = 450, stock = 10, category_id = sid WHERE sku = 'TEMP-071';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Toilet tissue holder', 'حامل مناديل للحمام', 'Wooden Toilet paper holder - Size: 45cm', 'حامل منايل للحمام خشب - المقاس: 45cm', 450, '071', 10) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '071' WHERE sku = 'TEMP-071';
        END IF;
    END IF;

    -- Updating 028 (as TEMP-028) to 070
    UPDATE public.products SET sku = '070', name_en = 'Kitchen tissue holder', name_ar = 'حامل منديل للمطبخ', description_en = 'Wooden Kitchen paper holder - Size: 36cm', description_ar = 'حامل مناديل للمطبخ خشب - المقاس: 36cm', price = 350, stock = 9, category_id = sid WHERE sku = 'TEMP-028';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Kitchen tissue holder', name_ar = 'حامل منديل للمطبخ', description_en = 'Wooden Kitchen paper holder - Size: 36cm', description_ar = 'حامل مناديل للمطبخ خشب - المقاس: 36cm', price = 350, stock = 9, category_id = sid WHERE sku = 'TEMP-070';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Kitchen tissue holder', 'حامل منديل للمطبخ', 'Wooden Kitchen paper holder - Size: 36cm', 'حامل مناديل للمطبخ خشب - المقاس: 36cm', 350, '070', 9) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '070' WHERE sku = 'TEMP-070';
        END IF;
    END IF;

    -- Updating 029 (as TEMP-029) to 069
    UPDATE public.products SET sku = '069', name_en = 'Pizza Set', name_ar = 'طقم بيتزا', description_en = 'A puzzle-style pizza set crafted from natural beech pine wood, 6 pieces', description_ar = 'طقم بيتزا 6 قطع مصنوع من خشب البيتش باين', price = 900, stock = 9, category_id = sid WHERE sku = 'TEMP-029';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Pizza Set', name_ar = 'طقم بيتزا', description_en = 'A puzzle-style pizza set crafted from natural beech pine wood, 6 pieces', description_ar = 'طقم بيتزا 6 قطع مصنوع من خشب البيتش باين', price = 900, stock = 9, category_id = sid WHERE sku = 'TEMP-069';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Pizza Set', 'طقم بيتزا', 'A puzzle-style pizza set crafted from natural beech pine wood, 6 pieces', 'طقم بيتزا 6 قطع مصنوع من خشب البيتش باين', 900, '069', 9) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '069' WHERE sku = 'TEMP-069';
        END IF;
    END IF;

    -- Updating 033 (as TEMP-033) to 068
    UPDATE public.products SET sku = '068', name_en = 'Desposable cutlery', name_ar = 'أدوات مائدة خشبية للاستخدام مرة واحدة', description_en = 'desposable wood cutlery, set of 12 (4 spoons, 4 forks & 4 knives)', description_ar = 'أدوات مائدة خشبية للاستخدام مرة واحدة12 قطعه', price = 85, stock = 5000, category_id = sid WHERE sku = 'TEMP-033';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Desposable cutlery', name_ar = 'أدوات مائدة خشبية للاستخدام مرة واحدة', description_en = 'desposable wood cutlery, set of 12 (4 spoons, 4 forks & 4 knives)', description_ar = 'أدوات مائدة خشبية للاستخدام مرة واحدة12 قطعه', price = 85, stock = 5000, category_id = sid WHERE sku = 'TEMP-068';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Desposable cutlery', 'أدوات مائدة خشبية للاستخدام مرة واحدة', 'desposable wood cutlery, set of 12 (4 spoons, 4 forks & 4 knives)', 'أدوات مائدة خشبية للاستخدام مرة واحدة12 قطعه', 85, '068', 5000) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '068' WHERE sku = 'TEMP-068';
        END IF;
    END IF;

    -- Updating 056 (as TEMP-056) to 067
    UPDATE public.products SET sku = '067', name_en = 'Cutlery Set Magnet', name_ar = 'معالق مغناطيس', description_en = 'Cutlery Set Fridge Magnet, 3 pieces - Size: 18*13', description_ar = 'شكل مغناطيس للمطبخ - المقاس: 18*13', price = 60, stock = 22, category_id = sid WHERE sku = 'TEMP-056';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Cutlery Set Magnet', name_ar = 'معالق مغناطيس', description_en = 'Cutlery Set Fridge Magnet, 3 pieces - Size: 18*13', description_ar = 'شكل مغناطيس للمطبخ - المقاس: 18*13', price = 60, stock = 22, category_id = sid WHERE sku = 'TEMP-067';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Cutlery Set Magnet', 'معالق مغناطيس', 'Cutlery Set Fridge Magnet, 3 pieces - Size: 18*13', 'شكل مغناطيس للمطبخ - المقاس: 18*13', 60, '067', 22) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '067' WHERE sku = 'TEMP-067';
        END IF;
    END IF;

    -- Updating 057 (as TEMP-057) to 066
    UPDATE public.products SET sku = '066', name_en = 'Welcome magnet', name_ar = 'اهلا مغناطيس', description_en = 'Wood "Welcome" magnet', description_ar = 'مغناطيس خشبي مكتوب عليه "مرحباً"', price = 100, stock = 2, category_id = sid WHERE sku = 'TEMP-057';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Welcome magnet', name_ar = 'اهلا مغناطيس', description_en = 'Wood "Welcome" magnet', description_ar = 'مغناطيس خشبي مكتوب عليه "مرحباً"', price = 100, stock = 2, category_id = sid WHERE sku = 'TEMP-066';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Welcome magnet', 'اهلا مغناطيس', 'Wood "Welcome" magnet', 'مغناطيس خشبي مكتوب عليه "مرحباً"', 100, '066', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '066' WHERE sku = 'TEMP-066';
        END IF;
    END IF;

    -- Updating 058 (as TEMP-058) to 065
    UPDATE public.products SET sku = '065', name_en = 'Kitchen magnet', name_ar = 'مطبخ مغناطيس', description_en = 'Wood "Kitchen" magnet', description_ar = 'مغناطيس خشبي مكتوب عليه "مطبخ"', price = 100, stock = 12, category_id = sid WHERE sku = 'TEMP-058';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Kitchen magnet', name_ar = 'مطبخ مغناطيس', description_en = 'Wood "Kitchen" magnet', description_ar = 'مغناطيس خشبي مكتوب عليه "مطبخ"', price = 100, stock = 12, category_id = sid WHERE sku = 'TEMP-065';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Kitchen magnet', 'مطبخ مغناطيس', 'Wood "Kitchen" magnet', 'مغناطيس خشبي مكتوب عليه "مطبخ"', 100, '065', 12) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '065' WHERE sku = 'TEMP-065';
        END IF;
    END IF;

    -- Updating 059 (as TEMP-059) to 064-02
    UPDATE public.products SET sku = '064-02', name_en = 'Small Crescent Serving Stand', name_ar = 'ستاند صغير تقديم شكل هلال، بني غامق', description_en = 'Small Wooden crescent-shaped serving stand, easy to assemble and disassemble, dark brown - Size: 50*25', description_ar = 'ستاند صغير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني غامق - المقاس: 50*25', price = 500, stock = 7, category_id = nid WHERE sku = 'TEMP-059';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Small Crescent Serving Stand', name_ar = 'ستاند صغير تقديم شكل هلال، بني غامق', description_en = 'Small Wooden crescent-shaped serving stand, easy to assemble and disassemble, dark brown - Size: 50*25', description_ar = 'ستاند صغير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني غامق - المقاس: 50*25', price = 500, stock = 7, category_id = nid WHERE sku = 'TEMP-064-02';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Small Crescent Serving Stand', 'ستاند صغير تقديم شكل هلال، بني غامق', 'Small Wooden crescent-shaped serving stand, easy to assemble and disassemble, dark brown - Size: 50*25', 'ستاند صغير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني غامق - المقاس: 50*25', 500, '064-02', 7) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '064-02' WHERE sku = 'TEMP-064-02';
        END IF;
    END IF;

    -- Updating 060 (as TEMP-060) to 064-03
    UPDATE public.products SET sku = '064-03', name_en = 'Large Crescent Serving Stand', name_ar = 'ستاند كبير تقديم شكل هلال، بني غامق', description_en = 'Large Wooden crescent-shaped serving stand, easy to assemble and disassemble, dark brown - Size: 59*31', description_ar = 'ستاند كبير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني غامق - المقاس: 59*31', price = 700, stock = 2, category_id = nid WHERE sku = 'TEMP-060';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Large Crescent Serving Stand', name_ar = 'ستاند كبير تقديم شكل هلال، بني غامق', description_en = 'Large Wooden crescent-shaped serving stand, easy to assemble and disassemble, dark brown - Size: 59*31', description_ar = 'ستاند كبير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني غامق - المقاس: 59*31', price = 700, stock = 2, category_id = nid WHERE sku = 'TEMP-064-03';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Large Crescent Serving Stand', 'ستاند كبير تقديم شكل هلال، بني غامق', 'Large Wooden crescent-shaped serving stand, easy to assemble and disassemble, dark brown - Size: 59*31', 'ستاند كبير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني غامق - المقاس: 59*31', 700, '064-03', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '064-03' WHERE sku = 'TEMP-064-03';
        END IF;
    END IF;

    -- Updating 061 (as TEMP-061) to 063-02
    UPDATE public.products SET sku = '063-02', name_en = 'Small Crescent Serving Stand', name_ar = 'ستاند صغير تقديم شكل هلال، بني فاتح', description_en = 'Small Wooden crescent-shaped serving stand, easy to assemble and disassemble, light brown - Size: 59*31', description_ar = 'ستاند صغير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني فاتح - المقاس: 59*31', price = 500, stock = 6, category_id = nid WHERE sku = 'TEMP-061';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Small Crescent Serving Stand', name_ar = 'ستاند صغير تقديم شكل هلال، بني فاتح', description_en = 'Small Wooden crescent-shaped serving stand, easy to assemble and disassemble, light brown - Size: 59*31', description_ar = 'ستاند صغير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني فاتح - المقاس: 59*31', price = 500, stock = 6, category_id = nid WHERE sku = 'TEMP-063-02';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Small Crescent Serving Stand', 'ستاند صغير تقديم شكل هلال، بني فاتح', 'Small Wooden crescent-shaped serving stand, easy to assemble and disassemble, light brown - Size: 59*31', 'ستاند صغير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني فاتح - المقاس: 59*31', 500, '063-02', 6) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '063-02' WHERE sku = 'TEMP-063-02';
        END IF;
    END IF;

    -- Updating 062 (as TEMP-062) to 063-03
    UPDATE public.products SET sku = '063-03', name_en = 'Large Crescent Serving Stand', name_ar = 'ستاند كبير تقديم شكل هلال، بني فاتح', description_en = 'Large Wooden crescent-shaped serving stand, easy to assemble and disassemble, light brown - Size: 50*25', description_ar = 'ستاند كبير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني فاتح - المقاس: 50*25', price = 500, stock = 3, category_id = nid WHERE sku = 'TEMP-062';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Large Crescent Serving Stand', name_ar = 'ستاند كبير تقديم شكل هلال، بني فاتح', description_en = 'Large Wooden crescent-shaped serving stand, easy to assemble and disassemble, light brown - Size: 50*25', description_ar = 'ستاند كبير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني فاتح - المقاس: 50*25', price = 500, stock = 3, category_id = nid WHERE sku = 'TEMP-063-03';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Large Crescent Serving Stand', 'ستاند كبير تقديم شكل هلال، بني فاتح', 'Large Wooden crescent-shaped serving stand, easy to assemble and disassemble, light brown - Size: 50*25', 'ستاند كبير خشبي تقديم علي شكل هلال، ستاند فك وتركيب ، بني فاتح - المقاس: 50*25', 500, '063-03', 3) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '063-03' WHERE sku = 'TEMP-063-03';
        END IF;
    END IF;

    -- Updating 065 (as TEMP-065) to 064-01
    UPDATE public.products SET sku = '064-01', name_en = 'Set of Crescent Serving Stand, dark brown', name_ar = 'ستاند تقديم شكل القمر', description_en = 'Set of 2, Wooden crescent-shaped serving stands, easy to assemble and disassemble, dark brown', description_ar = 'ستاند تقديم شكل القمر خشب', price = 1100, stock = 10, category_id = nid WHERE sku = 'TEMP-065';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Set of Crescent Serving Stand, dark brown', name_ar = 'ستاند تقديم شكل القمر', description_en = 'Set of 2, Wooden crescent-shaped serving stands, easy to assemble and disassemble, dark brown', description_ar = 'ستاند تقديم شكل القمر خشب', price = 1100, stock = 10, category_id = nid WHERE sku = 'TEMP-064-01';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Set of Crescent Serving Stand, dark brown', 'ستاند تقديم شكل القمر', 'Set of 2, Wooden crescent-shaped serving stands, easy to assemble and disassemble, dark brown', 'ستاند تقديم شكل القمر خشب', 1100, '064-01', 10) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '064-01' WHERE sku = 'TEMP-064-01';
        END IF;
    END IF;

    -- Updating 066 (as TEMP-066) to 063-01
    UPDATE public.products SET sku = '063-01', name_en = 'Set of Crescent Serving Stand, light brown', name_ar = 'ستاند تقديم شكل القمر', description_en = 'Set of 2, Wooden crescent-shaped serving stands, easy to assemble and disassemble, light brown', description_ar = 'ستاند تقديم شكل القمر خشب', price = 1100, stock = 10, category_id = nid WHERE sku = 'TEMP-066';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Set of Crescent Serving Stand, light brown', name_ar = 'ستاند تقديم شكل القمر', description_en = 'Set of 2, Wooden crescent-shaped serving stands, easy to assemble and disassemble, light brown', description_ar = 'ستاند تقديم شكل القمر خشب', price = 1100, stock = 10, category_id = nid WHERE sku = 'TEMP-063-01';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Set of Crescent Serving Stand, light brown', 'ستاند تقديم شكل القمر', 'Set of 2, Wooden crescent-shaped serving stands, easy to assemble and disassemble, light brown', 'ستاند تقديم شكل القمر خشب', 1100, '063-01', 10) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '063-01' WHERE sku = 'TEMP-063-01';
        END IF;
    END IF;

    -- Updating 068 (as TEMP-068) to 062
    UPDATE public.products SET sku = '062', name_en = 'Serving set', name_ar = 'طقم معالق', description_en = 'Serving set Beech Pine wooden, 4 pieces', description_ar = 'طقم معالق بيتش باين', price = 400, stock = 10, category_id = sid WHERE sku = 'TEMP-068';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Serving set', name_ar = 'طقم معالق', description_en = 'Serving set Beech Pine wooden, 4 pieces', description_ar = 'طقم معالق بيتش باين', price = 400, stock = 10, category_id = sid WHERE sku = 'TEMP-062';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Serving set', 'طقم معالق', 'Serving set Beech Pine wooden, 4 pieces', 'طقم معالق بيتش باين', 400, '062', 10) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '062' WHERE sku = 'TEMP-062';
        END IF;
    END IF;

    -- Updating 035 (as TEMP-035) to 061
    UPDATE public.products SET sku = '061', name_en = 'Star serving plate', name_ar = 'طبق تقديم علي شكل نجمه', description_en = 'Beech Pine star-shaped wooden serving plate - Size: 28cm', description_ar = 'طبق خشبي علي شكل نجمه مصنوع من البيتش باين - المقاس: 28cm', price = 550, stock = 9, category_id = nid WHERE sku = 'TEMP-035';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Star serving plate', name_ar = 'طبق تقديم علي شكل نجمه', description_en = 'Beech Pine star-shaped wooden serving plate - Size: 28cm', description_ar = 'طبق خشبي علي شكل نجمه مصنوع من البيتش باين - المقاس: 28cm', price = 550, stock = 9, category_id = nid WHERE sku = 'TEMP-061';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Star serving plate', 'طبق تقديم علي شكل نجمه', 'Beech Pine star-shaped wooden serving plate - Size: 28cm', 'طبق خشبي علي شكل نجمه مصنوع من البيتش باين - المقاس: 28cm', 550, '061', 9) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '061' WHERE sku = 'TEMP-061';
        END IF;
    END IF;

    -- Updating 037 (as TEMP-037) to 060-01
    UPDATE public.products SET sku = '060-01', name_en = 'Set of Star serving plate', name_ar = 'طقم اطباق نجمه', description_en = 'Set of 2 beech pine wooden star serving plate', description_ar = 'طقم اطباق نجمه مصنوع من خشب البيتش باين، طقم مكون من ٣ قطع', price = 800, stock = 2, category_id = nid WHERE sku = 'TEMP-037';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Set of Star serving plate', name_ar = 'طقم اطباق نجمه', description_en = 'Set of 2 beech pine wooden star serving plate', description_ar = 'طقم اطباق نجمه مصنوع من خشب البيتش باين، طقم مكون من ٣ قطع', price = 800, stock = 2, category_id = nid WHERE sku = 'TEMP-060-01';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Set of Star serving plate', 'طقم اطباق نجمه', 'Set of 2 beech pine wooden star serving plate', 'طقم اطباق نجمه مصنوع من خشب البيتش باين، طقم مكون من ٣ قطع', 800, '060-01', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '060-01' WHERE sku = 'TEMP-060-01';
        END IF;
    END IF;

    -- Inserting/Updating 060-02
    UPDATE public.products SET sku = '060-02', name_en = 'Small Star serving plate', name_ar = 'طبق نجمه صغير', description_en = 'Small beech pine wooden star serving plate - Size: small', description_ar = 'طبق صغير علي شكل نجمه مصنوع من خشب البيتش باين - المقاس: small', price = 250, stock = 8, category_id = nid WHERE sku = 'TEMP-060-02';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Small Star serving plate', 'طبق نجمه صغير', 'Small beech pine wooden star serving plate - Size: small', 'طبق صغير علي شكل نجمه مصنوع من خشب البيتش باين - المقاس: small', 250, '060-02', 8) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 060-03
    UPDATE public.products SET sku = '060-03', name_en = 'Meduim Star serving plate', name_ar = 'طبق نجمه وسط', description_en = 'Meduim beech pine wooden star serving plate - Size: meduim', description_ar = 'طبق وسط علي شكل نجمه مصنوع من خشب البيتش باين - المقاس: meduim', price = 300, stock = 2, category_id = nid WHERE sku = 'TEMP-060-03';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Meduim Star serving plate', 'طبق نجمه وسط', 'Meduim beech pine wooden star serving plate - Size: meduim', 'طبق وسط علي شكل نجمه مصنوع من خشب البيتش باين - المقاس: meduim', 300, '060-03', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 060-04
    UPDATE public.products SET sku = '060-04', name_en = 'Large Star serving plate', name_ar = 'طبق نجمه كبير', description_en = 'Large beech pine wooden star serving plate - Size: large', description_ar = 'طبق كبير علي شكل نجمه مصنوع من خشب البيتش باين - المقاس: large', price = 350, stock = 3, category_id = nid WHERE sku = 'TEMP-060-04';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Large Star serving plate', 'طبق نجمه كبير', 'Large beech pine wooden star serving plate - Size: large', 'طبق كبير علي شكل نجمه مصنوع من خشب البيتش باين - المقاس: large', 350, '060-04', 3) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 039 (as TEMP-039) to 059
    UPDATE public.products SET sku = '059', name_en = 'Lantern plate', name_ar = 'طبق فانوس', description_en = 'Beech Pine lantern wooden serving plate - Size: 36*21', description_ar = 'طبق فانوس رمضان من خشب البيتش باين - المقاس: 36*21', price = 600, stock = 10, category_id = nid WHERE sku = 'TEMP-039';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Lantern plate', name_ar = 'طبق فانوس', description_en = 'Beech Pine lantern wooden serving plate - Size: 36*21', description_ar = 'طبق فانوس رمضان من خشب البيتش باين - المقاس: 36*21', price = 600, stock = 10, category_id = nid WHERE sku = 'TEMP-059';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Lantern plate', 'طبق فانوس', 'Beech Pine lantern wooden serving plate - Size: 36*21', 'طبق فانوس رمضان من خشب البيتش باين - المقاس: 36*21', 600, '059', 10) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '059' WHERE sku = 'TEMP-059';
        END IF;
    END IF;

    -- Updating 041 (as TEMP-041) to 058
    UPDATE public.products SET sku = '058', name_en = 'Ramadan Mosque Plate', name_ar = 'طبق رمضان', description_en = 'Beech Pine Ramadan Mosque Plate - Size: 38*28', description_ar = 'طبق مسجد رمضان من خشب البيتش باين - المقاس: 38*28', price = 600, stock = 8, category_id = nid WHERE sku = 'TEMP-041';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Ramadan Mosque Plate', name_ar = 'طبق رمضان', description_en = 'Beech Pine Ramadan Mosque Plate - Size: 38*28', description_ar = 'طبق مسجد رمضان من خشب البيتش باين - المقاس: 38*28', price = 600, stock = 8, category_id = nid WHERE sku = 'TEMP-058';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Ramadan Mosque Plate', 'طبق رمضان', 'Beech Pine Ramadan Mosque Plate - Size: 38*28', 'طبق مسجد رمضان من خشب البيتش باين - المقاس: 38*28', 600, '058', 8) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '058' WHERE sku = 'TEMP-058';
        END IF;
    END IF;

    -- Updating 052 (as TEMP-052) to 057
    UPDATE public.products SET sku = '057', name_en = 'Crescent plate', name_ar = 'طبق هلال', description_en = 'Crescent plate Beech Pine wooden - Size: 29*25', description_ar = 'طبق هلال خشب بيتش باين - المقاس: 29*25', price = 450, stock = 8, category_id = nid WHERE sku = 'TEMP-052';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Crescent plate', name_ar = 'طبق هلال', description_en = 'Crescent plate Beech Pine wooden - Size: 29*25', description_ar = 'طبق هلال خشب بيتش باين - المقاس: 29*25', price = 450, stock = 8, category_id = nid WHERE sku = 'TEMP-057';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Crescent plate', 'طبق هلال', 'Crescent plate Beech Pine wooden - Size: 29*25', 'طبق هلال خشب بيتش باين - المقاس: 29*25', 450, '057', 8) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '057' WHERE sku = 'TEMP-057';
        END IF;
    END IF;

    -- Updating 054 (as TEMP-054) to 056
    UPDATE public.products SET sku = '056', name_en = 'Crescent decoration', name_ar = '', description_en = 'Crescent wooden decoration - Size: 18*15', description_ar = 'قانوس رمضان خشب صغير - المقاس: 18*15', price = 100, stock = 3, category_id = nid WHERE sku = 'TEMP-054';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Crescent decoration', name_ar = '', description_en = 'Crescent wooden decoration - Size: 18*15', description_ar = 'قانوس رمضان خشب صغير - المقاس: 18*15', price = 100, stock = 3, category_id = nid WHERE sku = 'TEMP-056';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Crescent decoration', '', 'Crescent wooden decoration - Size: 18*15', 'قانوس رمضان خشب صغير - المقاس: 18*15', 100, '056', 3) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '056' WHERE sku = 'TEMP-056';
        END IF;
    END IF;

    -- Updating 055 (as TEMP-055) to 055
    UPDATE public.products SET sku = '055', name_en = 'Ramadan napkin holder', name_ar = 'حامل مناديل', description_en = 'Ramadan napkin wooden holder - Size: 7*5', description_ar = 'حامل مناديل صغير - المقاس: 7*5', price = 150, stock = 10, category_id = nid WHERE sku = 'TEMP-055';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Ramadan napkin holder', name_ar = 'حامل مناديل', description_en = 'Ramadan napkin wooden holder - Size: 7*5', description_ar = 'حامل مناديل صغير - المقاس: 7*5', price = 150, stock = 10, category_id = nid WHERE sku = 'TEMP-055';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (nid, 'Ramadan napkin holder', 'حامل مناديل', 'Ramadan napkin wooden holder - Size: 7*5', 'حامل مناديل صغير - المقاس: 7*5', 150, '055', 10) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '055' WHERE sku = 'TEMP-055';
        END IF;
    END IF;

    -- Updating 001 (as TEMP-001) to 054-01
    UPDATE public.products SET sku = '054-01', name_en = 'Set of pizza serving plates', name_ar = 'مجموعة أطباق تقديم البيتزا', description_en = 'Kaia wooden crafted pizza serving plates set of 3', description_ar = 'طقم اطباق بيتزا من خشب كايا طقم 3 قطع', price = 1400, stock = 1, category_id = sid WHERE sku = 'TEMP-001';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Set of pizza serving plates', name_ar = 'مجموعة أطباق تقديم البيتزا', description_en = 'Kaia wooden crafted pizza serving plates set of 3', description_ar = 'طقم اطباق بيتزا من خشب كايا طقم 3 قطع', price = 1400, stock = 1, category_id = sid WHERE sku = 'TEMP-054-01';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Set of pizza serving plates', 'مجموعة أطباق تقديم البيتزا', 'Kaia wooden crafted pizza serving plates set of 3', 'طقم اطباق بيتزا من خشب كايا طقم 3 قطع', 1400, '054-01', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '054-01' WHERE sku = 'TEMP-054-01';
        END IF;
    END IF;

    -- Inserting/Updating 054-02
    UPDATE public.products SET sku = '054-02', name_en = 'Small pizza serving plates', name_ar = 'طبق بيتزا صغير', description_en = 'Small Kaia wooden crafted pizza serving plates - Size: small', description_ar = 'طبق تقديم بيتزا صغير من خشب كايا - المقاس: small', price = 400, stock = 1, category_id = sid WHERE sku = 'TEMP-054-02';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Small pizza serving plates', 'طبق بيتزا صغير', 'Small Kaia wooden crafted pizza serving plates - Size: small', 'طبق تقديم بيتزا صغير من خشب كايا - المقاس: small', 400, '054-02', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 054-03
    UPDATE public.products SET sku = '054-03', name_en = 'Meduim pizza serving plates', name_ar = 'طبق بيتزا وسط', description_en = 'Meduim Kaia wooden crafted pizza serving plates - Size: meduim', description_ar = 'طبق تقديم بيتزا وسط من خشب كايا - المقاس: meduim', price = 500, stock = 1, category_id = sid WHERE sku = 'TEMP-054-03';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Meduim pizza serving plates', 'طبق بيتزا وسط', 'Meduim Kaia wooden crafted pizza serving plates - Size: meduim', 'طبق تقديم بيتزا وسط من خشب كايا - المقاس: meduim', 500, '054-03', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 054-04
    UPDATE public.products SET sku = '054-04', name_en = 'Large pizza serving plates', name_ar = 'طبق بيتزا كبير', description_en = 'Large Kaia wooden crafted pizza serving plates - Size: large', description_ar = 'طبق تقديم بيتزا كبير من خشب كايا - المقاس: large', price = 600, stock = 1, category_id = sid WHERE sku = 'TEMP-054-04';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Large pizza serving plates', 'طبق بيتزا كبير', 'Large Kaia wooden crafted pizza serving plates - Size: large', 'طبق تقديم بيتزا كبير من خشب كايا - المقاس: large', 600, '054-04', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 007 (as TEMP-007) to 053
    UPDATE public.products SET sku = '053', name_en = 'Big Heart', name_ar = 'طبق قلب كبير', description_en = 'sheesham wooden crafted big heart plate - Size: 26*27', description_ar = 'طبق قلب كبير مصنوع من خشب السرسوع - المقاس: 26*27', price = 600, stock = 1, category_id = sid WHERE sku = 'TEMP-007';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Big Heart', name_ar = 'طبق قلب كبير', description_en = 'sheesham wooden crafted big heart plate - Size: 26*27', description_ar = 'طبق قلب كبير مصنوع من خشب السرسوع - المقاس: 26*27', price = 600, stock = 1, category_id = sid WHERE sku = 'TEMP-053';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Big Heart', 'طبق قلب كبير', 'sheesham wooden crafted big heart plate - Size: 26*27', 'طبق قلب كبير مصنوع من خشب السرسوع - المقاس: 26*27', 600, '053', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '053' WHERE sku = 'TEMP-053';
        END IF;
    END IF;

    -- Updating 008 (as TEMP-008) to 052
    UPDATE public.products SET sku = '052', name_en = 'Small Heart', name_ar = 'طبق قلب صغير', description_en = 'sheesham wooden crafted small heart plate - Size: 24*20', description_ar = 'طبق قلب صغير مصنوع من خشب السرسوع - المقاس: 24*20', price = 500, stock = 1, category_id = sid WHERE sku = 'TEMP-008';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Small Heart', name_ar = 'طبق قلب صغير', description_en = 'sheesham wooden crafted small heart plate - Size: 24*20', description_ar = 'طبق قلب صغير مصنوع من خشب السرسوع - المقاس: 24*20', price = 500, stock = 1, category_id = sid WHERE sku = 'TEMP-052';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Small Heart', 'طبق قلب صغير', 'sheesham wooden crafted small heart plate - Size: 24*20', 'طبق قلب صغير مصنوع من خشب السرسوع - المقاس: 24*20', 500, '052', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '052' WHERE sku = 'TEMP-052';
        END IF;
    END IF;

    -- Updating 024 (as TEMP-024) to 051-01
    UPDATE public.products SET sku = '051-01', name_en = 'Set of Mini plates', name_ar = 'طقم اطباق صغيره', description_en = 'Beech Pine wooden plate with handle Set of 2 - Size: 14cm', description_ar = 'طبق خشبي من خشب البيتش باين بمقبض خشبي، طقم من قطعتين - المقاس: 14cm', price = 500, stock = 1, category_id = sid WHERE sku = 'TEMP-024';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Set of Mini plates', name_ar = 'طقم اطباق صغيره', description_en = 'Beech Pine wooden plate with handle Set of 2 - Size: 14cm', description_ar = 'طبق خشبي من خشب البيتش باين بمقبض خشبي، طقم من قطعتين - المقاس: 14cm', price = 500, stock = 1, category_id = sid WHERE sku = 'TEMP-051-01';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Set of Mini plates', 'طقم اطباق صغيره', 'Beech Pine wooden plate with handle Set of 2 - Size: 14cm', 'طبق خشبي من خشب البيتش باين بمقبض خشبي، طقم من قطعتين - المقاس: 14cm', 500, '051-01', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '051-01' WHERE sku = 'TEMP-051-01';
        END IF;
    END IF;

    -- Inserting/Updating 051-02
    UPDATE public.products SET sku = '051-02', name_en = 'Mini plates', name_ar = 'طبق صغير', description_en = 'Small Beech Pine wooden plate with handle - Size: small', description_ar = 'طبق خشبي صغير من خشب البيتش باين بمقبض خشبي - المقاس: small', price = 250, stock = 7, category_id = sid WHERE sku = 'TEMP-051-02';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Mini plates', 'طبق صغير', 'Small Beech Pine wooden plate with handle - Size: small', 'طبق خشبي صغير من خشب البيتش باين بمقبض خشبي - المقاس: small', 250, '051-02', 7) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Inserting/Updating 051-03
    UPDATE public.products SET sku = '051-03', name_en = 'Mini plates', name_ar = 'طبق صغير', description_en = 'Meduim Beech Pine wooden plate with handle - Size: meduim', description_ar = 'طبق خشبي وسط من خشب البيتش باين بمقبض خشبي - المقاس: meduim', price = 300, stock = 1, category_id = sid WHERE sku = 'TEMP-051-03';
    IF NOT FOUND THEN
        INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Mini plates', 'طبق صغير', 'Meduim Beech Pine wooden plate with handle - Size: meduim', 'طبق خشبي وسط من خشب البيتش باين بمقبض خشبي - المقاس: meduim', 300, '051-03', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
    END IF;

    -- Updating 025 (as TEMP-025) to 050
    UPDATE public.products SET sku = '050', name_en = 'Kaia large plate', name_ar = 'طبق كايا كبير', description_en = 'Large Kaia Wood Plate - Size: 38*23', description_ar = 'طبق كبير خشب كايا - المقاس: 38*23', price = 800, stock = 1, category_id = sid WHERE sku = 'TEMP-025';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Kaia large plate', name_ar = 'طبق كايا كبير', description_en = 'Large Kaia Wood Plate - Size: 38*23', description_ar = 'طبق كبير خشب كايا - المقاس: 38*23', price = 800, stock = 1, category_id = sid WHERE sku = 'TEMP-050';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (sid, 'Kaia large plate', 'طبق كايا كبير', 'Large Kaia Wood Plate - Size: 38*23', 'طبق كبير خشب كايا - المقاس: 38*23', 800, '050', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '050' WHERE sku = 'TEMP-050';
        END IF;
    END IF;

    -- Updating 026 (as TEMP-026) to 049
    UPDATE public.products SET sku = '049', name_en = 'Round sheesham board', name_ar = 'بورد دائرى سرسوع', description_en = 'Round sheesham board - Size: 29cm', description_ar = 'بورد دائره خشب السرسوع - المقاس: 29cm', price = 600, stock = 6, category_id = bid WHERE sku = 'TEMP-026';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Round sheesham board', name_ar = 'بورد دائرى سرسوع', description_en = 'Round sheesham board - Size: 29cm', description_ar = 'بورد دائره خشب السرسوع - المقاس: 29cm', price = 600, stock = 6, category_id = bid WHERE sku = 'TEMP-049';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Round sheesham board', 'بورد دائرى سرسوع', 'Round sheesham board - Size: 29cm', 'بورد دائره خشب السرسوع - المقاس: 29cm', 600, '049', 6) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '049' WHERE sku = 'TEMP-049';
        END IF;
    END IF;

    -- Updating 034 (as TEMP-034) to 048
    UPDATE public.products SET sku = '048', name_en = 'Mini Round board', name_ar = 'لوح مستدير صغير', description_en = 'Mini Round board with handle - Size: 27*18', description_ar = 'لوح مستدير صغير مصنوع من البيتش باين بيد - المقاس: 27*18', price = 350, stock = 1, category_id = bid WHERE sku = 'TEMP-034';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Mini Round board', name_ar = 'لوح مستدير صغير', description_en = 'Mini Round board with handle - Size: 27*18', description_ar = 'لوح مستدير صغير مصنوع من البيتش باين بيد - المقاس: 27*18', price = 350, stock = 1, category_id = bid WHERE sku = 'TEMP-048';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Mini Round board', 'لوح مستدير صغير', 'Mini Round board with handle - Size: 27*18', 'لوح مستدير صغير مصنوع من البيتش باين بيد - المقاس: 27*18', 350, '048', 1) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '048' WHERE sku = 'TEMP-048';
        END IF;
    END IF;

    -- Updating 044 (as TEMP-044) to 047
    UPDATE public.products SET sku = '047', name_en = 'Round cutting board', name_ar = 'لوح دائرى للتقطيع', description_en = 'Round sheesham wooden cutting board - Size: 34*29', description_ar = 'لوح تقطيع خشبي دائري من خشب السرسوع - المقاس: 34*29', price = 600, stock = 4, category_id = bid WHERE sku = 'TEMP-044';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Round cutting board', name_ar = 'لوح دائرى للتقطيع', description_en = 'Round sheesham wooden cutting board - Size: 34*29', description_ar = 'لوح تقطيع خشبي دائري من خشب السرسوع - المقاس: 34*29', price = 600, stock = 4, category_id = bid WHERE sku = 'TEMP-047';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Round cutting board', 'لوح دائرى للتقطيع', 'Round sheesham wooden cutting board - Size: 34*29', 'لوح تقطيع خشبي دائري من خشب السرسوع - المقاس: 34*29', 600, '047', 4) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '047' WHERE sku = 'TEMP-047';
        END IF;
    END IF;

    -- Updating 050 (as TEMP-050) to 046
    UPDATE public.products SET sku = '046', name_en = 'Stripe cutting board', name_ar = 'لوح تقطيع مخطط', description_en = 'mix sheesham - Beech Pine Wood cutting board with handle - Size: 42*20', description_ar = 'لوح تقطيع من خشب السرسوع و خشب البيتش باين - المقاس: 42*20', price = 650, stock = 2, category_id = bid WHERE sku = 'TEMP-050';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Stripe cutting board', name_ar = 'لوح تقطيع مخطط', description_en = 'mix sheesham - Beech Pine Wood cutting board with handle - Size: 42*20', description_ar = 'لوح تقطيع من خشب السرسوع و خشب البيتش باين - المقاس: 42*20', price = 650, stock = 2, category_id = bid WHERE sku = 'TEMP-046';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Stripe cutting board', 'لوح تقطيع مخطط', 'mix sheesham - Beech Pine Wood cutting board with handle - Size: 42*20', 'لوح تقطيع من خشب السرسوع و خشب البيتش باين - المقاس: 42*20', 650, '046', 2) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '046' WHERE sku = 'TEMP-046';
        END IF;
    END IF;

    -- Updating 051 (as TEMP-051) to 045
    UPDATE public.products SET sku = '045', name_en = 'Cutting board', name_ar = 'لوح تقطيع', description_en = 'Small Sheesham wood Cutting board - Size: 42*25', description_ar = 'لوح تقطيع خشب السرسوع - المقاس: 42*25', price = 700, stock = 3, category_id = bid WHERE sku = 'TEMP-051';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Cutting board', name_ar = 'لوح تقطيع', description_en = 'Small Sheesham wood Cutting board - Size: 42*25', description_ar = 'لوح تقطيع خشب السرسوع - المقاس: 42*25', price = 700, stock = 3, category_id = bid WHERE sku = 'TEMP-045';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Cutting board', 'لوح تقطيع', 'Small Sheesham wood Cutting board - Size: 42*25', 'لوح تقطيع خشب السرسوع - المقاس: 42*25', 700, '045', 3) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '045' WHERE sku = 'TEMP-045';
        END IF;
    END IF;

    -- Updating 069 (as TEMP-069) to 044
    UPDATE public.products SET sku = '044', name_en = 'Cutting board', name_ar = 'لوح تقطيع', description_en = 'Large Sheesham wood Cutting board - Size: 46*25', description_ar = 'لوح تقطيع خشب السرسوع - المقاس: 46*25', price = 800, stock = 4, category_id = bid WHERE sku = 'TEMP-069';
    IF NOT FOUND THEN
        UPDATE public.products SET name_en = 'Cutting board', name_ar = 'لوح تقطيع', description_en = 'Large Sheesham wood Cutting board - Size: 46*25', description_ar = 'لوح تقطيع خشب السرسوع - المقاس: 46*25', price = 800, stock = 4, category_id = bid WHERE sku = 'TEMP-044';
        IF NOT FOUND THEN
            INSERT INTO public.products (category_id, name_en, name_ar, description_en, description_ar, price, sku, stock) VALUES (bid, 'Cutting board', 'لوح تقطيع', 'Large Sheesham wood Cutting board - Size: 46*25', 'لوح تقطيع خشب السرسوع - المقاس: 46*25', 800, '044', 4) ON CONFLICT (sku) DO UPDATE SET name_en = EXCLUDED.name_en, name_ar = EXCLUDED.name_ar, description_en = EXCLUDED.description_en, description_ar = EXCLUDED.description_ar, price = EXCLUDED.price, stock = EXCLUDED.stock, category_id = EXCLUDED.category_id;
        ELSE
            UPDATE public.products SET sku = '044' WHERE sku = 'TEMP-044';
        END IF;
    END IF;

END $$;
