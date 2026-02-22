const { createClient } = require('@supabase/supabase-js');

// Use environment variables — never hardcode secrets
// Set SUPABASE_URL and SUPABASE_SERVICE_KEY in your shell before running:
//   export SUPABASE_URL=https://...
//   export SUPABASE_SERVICE_KEY=eyJ...
const supabaseUrl = process.env.SUPABASE_URL;
const serviceKey = process.env.SUPABASE_SERVICE_KEY;

if (!supabaseUrl || !serviceKey) {
    console.error('Missing SUPABASE_URL or SUPABASE_SERVICE_KEY env vars');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, serviceKey);

async function main() {
    const { data: cats, error } = await supabase.from('categories').select('id, name_en, image_url').order('name_en');
    if (error) { console.error('Error fetching categories:', error); process.exit(1); }
    console.log('Current categories:');
    cats.forEach(c => console.log(`  ${c.id}: ${c.name_en} => ${c.image_url || '(none)'}`));

    const imageMap = [
        { keyword: 'board', url: `${supabaseUrl}/storage/v1/object/public/categories/boards.jpg` },
        { keyword: 'season', url: `${supabaseUrl}/storage/v1/object/public/categories/seasons.jpg` },
        { keyword: 'tray', url: `${supabaseUrl}/storage/v1/object/public/categories/trays.jpg` },
        { keyword: 'serv', url: `${supabaseUrl}/storage/v1/object/public/categories/serving.jpg` },
    ];

    for (const cat of cats) {
        const nameL = cat.name_en.toLowerCase();
        const match = imageMap.find(m => nameL.includes(m.keyword));
        if (match) {
            const { error: updateErr } = await supabase.from('categories').update({ image_url: match.url }).eq('id', cat.id);
            if (updateErr) console.error(`Failed to update ${cat.name_en}:`, updateErr);
            else console.log(`✓ Updated ${cat.name_en}`);
        }
    }
}

main().catch(console.error);
