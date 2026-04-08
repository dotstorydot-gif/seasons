const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
    'https://itbgqzgummdfcrzsydmc.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml0Ymdxemd1bW1kZmNyenN5ZG1jIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MTc1NDY4MiwiZXhwIjoyMDg3MzMwNjgyfQ.vayQiU1abJ8bvZ4DbovsVWaywRRNtSofzUUq3lz0ywc'
);

const easterProducts = [
    {
        sku: 'E001',
        name_en: 'Easter holder - 4 eggs',
        name_ar: 'حامل بيض عيد الفصح - 4 بيضات',
        description_en: 'Easter board with handle for 4 eggs',
        description_ar: 'لوح عيد الفصح بمقبض لـ 4 بيضات',
        price: 110,
        size_en: '36*9.5',
        size_ar: '36*9.5',
        stock: 1,
        tags: ['easter eggs'],
        images: [
            '/images/1-seasons special/001-Easter Holder -4 eggs/001-Easter-holder---4-eggs-01.png',
            '/images/1-seasons special/001-Easter Holder -4 eggs/001-Easter-holder---4-eggs-02.png',
            '/images/1-seasons special/001-Easter Holder -4 eggs/001-Easter-holder---4-eggs-03.png'
        ]
    },
    {
        sku: 'E002',
        name_en: 'Easter holder - 6 eggs',
        name_ar: 'حامل بيض عيد الفصح - 6 بيضات',
        description_en: 'Easter holder board with handle for 6 eggs',
        description_ar: 'لوح حامل بيض عيد الفصح بمقبض لـ 6 بيضات',
        price: 120,
        size_en: '28.5*14',
        size_ar: '28.5*14',
        stock: 2,
        tags: ['easter eggs'],
        images: [
            '/images/1-seasons special/002-Easter Holder-6 eggs/002-Easter-holder---6-eggs-01.png',
            '/images/1-seasons special/002-Easter Holder-6 eggs/002-Easter-holder---6-eggs-02.png',
            '/images/1-seasons special/002-Easter Holder-6 eggs/002-Easter-holder---6-eggs-03.png'
        ]
    },
    {
        sku: 'E003',
        name_en: 'Easter holder - 4 eggs',
        name_ar: 'حامل بيض عيد الفصح - 4 بيضات مربع',
        description_en: 'Easter squared board with handle for 4 eggs',
        description_ar: 'لوح عيد الفصح المربع بمقبض لـ 4 بيضات',
        price: 110,
        size_en: '23*14',
        size_ar: '23*14',
        stock: 1,
        tags: ['easter eggs'],
        images: [
            '/images/1-seasons special/003-Easter Holder-4 eggs/003-Easter-holder---4-eggs-01.png',
            '/images/1-seasons special/003-Easter Holder-4 eggs/003-Easter-holder---4-eggs-02.png',
            '/images/1-seasons special/003-Easter Holder-4 eggs/003-Easter-holder---4-eggs-03.png'
        ]
    },
    {
        sku: 'E004',
        name_en: 'Easter holder - 5 eggs',
        name_ar: 'حامل بيض عيد الفصح - 5 بيضات',
        description_en: 'Easter board with handle for 5 eggs',
        description_ar: 'لوح عيد الفصح بمقبض لـ 5 بيضات',
        price: 120,
        size_en: '41.5*9.5',
        size_ar: '41.5*9.5',
        stock: 2,
        tags: ['easter eggs'],
        images: [
            '/images/1-seasons special/004-Easter holder - 5 eggs/004-Easter-holder---5-eggs-01.png',
            '/images/1-seasons special/004-Easter holder - 5 eggs/004-Easter-holder---5-eggs-02.png',
            '/images/1-seasons special/004-Easter holder - 5 eggs/004-Easter-holder---5-eggs-03.png'
        ]
    },
    {
        sku: 'E005',
        name_en: 'Easter holder - 8 eggs',
        name_ar: 'حامل بيض عيد الفصح - 8 بيضات',
        description_en: 'Easter holder with 2 handles for 8 eggs',
        description_ar: 'حامل بيض عيد الفصح بمقبضين لـ 8 بيضات',
        price: 180,
        size_en: '27*13.5',
        size_ar: '27*13.5',
        stock: 1,
        tags: ['easter eggs'],
        images: [
            '/images/1-seasons special/005-Easter holder - 8 eggs/005-Easter-holder---8-eggs-01.png',
            '/images/1-seasons special/005-Easter holder - 8 eggs/005-Easter-holder---8-eggs-02.png',
            '/images/1-seasons special/005-Easter holder - 8 eggs/005-Easter-holder---8-eggs-03.png'
        ]
    }
];

async function run() {
    // Get the seasons category ID
    const { data: category, error: catErr } = await supabase
        .from('categories')
        .select('id')
        .eq('slug', 'specials')
        .single();

    if (catErr || !category) {
        console.error('❌ Could not find "seasons" category:', catErr?.message);
        return;
    }

    console.log(`✅ Found seasons category: ${category.id}`);

    for (const product of easterProducts) {
        const payload = {
            category_id: category.id,
            name_en: product.name_en,
            name_ar: product.name_ar,
            description_en: product.description_en,
            description_ar: product.description_ar,
            price: product.price,
            sku: product.sku,
            stock: product.stock,
            size_en: product.size_en,
            size_ar: product.size_ar,
            tags: product.tags,
            images: product.images,
            is_featured: false
        };

        const { data, error } = await supabase
            .from('products')
            .upsert(payload, { onConflict: 'sku' })
            .select();

        if (error) {
            console.error(`❌ ${product.sku} (${product.name_en}): ${error.message}`);
        } else {
            console.log(`✅ ${product.sku} (${product.name_en}): inserted/updated successfully`);
        }
    }

    // Verify
    const { data: allEaster, error: verifyErr } = await supabase
        .from('products')
        .select('sku, name_en, price, images, size_en, tags')
        .in('sku', ['E001', 'E002', 'E003', 'E004', 'E005']);

    if (verifyErr) {
        console.error('❌ Verification failed:', verifyErr.message);
    } else {
        console.log('\n--- Verification ---');
        allEaster.forEach(p => {
            console.log(`  ${p.sku}: ${p.name_en} | ${p.price} EGP | Size: ${p.size_en} | Images: ${p.images?.length || 0} | Tags: ${p.tags?.join(', ')}`);
        });
        console.log(`\nTotal Easter products: ${allEaster.length}`);
    }
}

run();
