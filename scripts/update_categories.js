const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');
const https = require('https');

const supabaseUrl = 'https://itbgqzgummdfcrzsydmc.supabase.co';
const serviceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml0Ymdxemd1bW1kZmNyenN5ZG1jIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MTc1NDY4MiwiZXhwIjoyMDg3MzMwNjgyfQ.vayQiU1abJ8bvZ4DbovsVWaywRRNtSofzUUq3lz0ywc';

const supabase = createClient(supabaseUrl, serviceKey);

async function main() {
    // 1. List all categories
    const { data: cats, error } = await supabase.from('categories').select('id, name_en, image_url').order('name_en');
    if (error) { console.error('Error fetching categories:', error); process.exit(1); }
    console.log('Current categories:');
    cats.forEach(c => console.log(`  ${c.id}: ${c.name_en} => ${c.image_url || '(none)'}`));

    // 2. Image mapping based on name
    const imageMap = [
        { keyword: 'board', url: 'https://itbgqzgummdfcrzsydmc.supabase.co/storage/v1/object/public/categories/boards.jpg' },
        { keyword: 'season', url: 'https://itbgqzgummdfcrzsydmc.supabase.co/storage/v1/object/public/categories/seasons.jpg' },
        { keyword: 'bowl', url: 'https://itbgqzgummdfcrzsydmc.supabase.co/storage/v1/object/public/categories/bowls.jpg' },
        { keyword: 'tray', url: 'https://itbgqzgummdfcrzsydmc.supabase.co/storage/v1/object/public/categories/trays.jpg' },
    ];

    for (const cat of cats) {
        const nameL = cat.name_en.toLowerCase();
        const match = imageMap.find(m => nameL.includes(m.keyword));
        if (match) {
            const { error: updateErr } = await supabase.from('categories').update({ image_url: match.url }).eq('id', cat.id);
            if (updateErr) console.error(`Failed to update ${cat.name_en}:`, updateErr);
            else console.log(`✓ Updated ${cat.name_en} with image: ${match.url}`);
        }
    }

    // Verify
    const { data: updated } = await supabase.from('categories').select('name_en, image_url').order('name_en');
    console.log('\nUpdated categories:');
    updated.forEach(c => console.log(`  ${c.name_en}: ${c.image_url || '(none)'}`));
}

main().catch(console.error);
