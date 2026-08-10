const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.SUPABASE_SERVICE_ROLE_KEY
);

const baseDir = path.join(__dirname, '..', 'public', 'images', '4-serving');

async function run() {
    const folders = fs.readdirSync(baseDir).filter(f => fs.statSync(path.join(baseDir, f)).isDirectory());

    for (const folder of folders) {
        // Extract SKU. The format is either ddd or ddd-dd
        const match = folder.match(/^(\d{3}(?:-\d{2})?)/);
        if (!match) {
            console.log(`Skipping folder: ${folder} (No valid SKU found)`);
            continue;
        }
        const sku = match[1];

        let files = fs.readdirSync(path.join(baseDir, folder));
        // Filter out .DS_Store and non-image files if necessary, sort them
        files = files.filter(f => f.match(/\.(png|jpe?g|webp|gif)$/i)).sort();

        if (files.length === 0) {
            console.log(`❌ SKU ${sku} (${folder}): no images found`);
            continue;
        }

        const imageArray = files.map(f => `/images/4-serving/${folder}/${f}`);

        const { data: catData, error: fetchErr } = await supabase
            .from('products')
            .select('id, name_en')
            .eq('sku', sku)
            .single();

        if (fetchErr || !catData) {
            console.log(`❌ SKU ${sku} (${folder}): not found in DB`);
            continue;
        }

        const { error } = await supabase
            .from('products')
            .update({ images: imageArray })
            .eq('sku', sku);

        if (error) {
            console.log(`❌ ${catData.name_en} (${sku}): ${error.message}`);
        } else {
            console.log(`✅ ${catData.name_en} (${sku}): ${imageArray.length} images set`);
        }
    }
}

run();
