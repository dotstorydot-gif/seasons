const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');

const envFile = fs.readFileSync('.env.local', 'utf8');
const env = {};
envFile.split('\n').forEach(line => {
    const [key, value] = line.split('=');
    if (key && value) env[key.trim()] = value.trim();
});

const supabaseUrl = env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseAnonKey = env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

console.log('URL:', supabaseUrl);

const supabase = createClient(supabaseUrl, supabaseAnonKey);

async function checkData() {
    console.log('Checking Supabase connection...');
    try {
        const { data: catData, error: catError } = await supabase.from('categories').select('*', { count: 'exact', head: true });
        if (catError) console.error('Categories Error:', catError);
        else console.log('Categories Count:', catData, catError);

        const { data: prodData, error: prodError } = await supabase.from('products').select('*', { count: 'exact', head: true });
        if (prodError) console.error('Products Error:', prodError);
        else console.log('Products Count:', prodData, prodError);

        // Also check if any featured products exist
        const { count: featuredCount, error: featuredError } = await supabase.from('products').select('*', { count: 'exact', head: true }).eq('is_featured', true);
        console.log('Featured Products Count:', featuredCount);
    } catch (e) {
        console.error('Execution Error:', e);
    }
}

checkData();
