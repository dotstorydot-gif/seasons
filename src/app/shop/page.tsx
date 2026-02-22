import React from 'react';
import { Metadata } from 'next';
import { supabase } from '@/lib/supabase';
import ShopClient from './ShopClient';

export const metadata: Metadata = {
    title: 'Shop Collection',
    description: 'Explore our curated collection of handcrafted wooden pieces for your modern home.',
    openGraph: {
        title: 'Shop Handcrafted Wooden Decor | Seasons by Nature',
        description: 'Carefully curated wooden pieces handcrafted with love. Browse our full collection.',
    }
};

export default async function ShopPage() {
    const { data: productsData } = await supabase.from('products').select('*');
    const { data: categoriesData } = await supabase.from('categories').select('*');

    return (
        <ShopClient
            initialProducts={productsData || []}
            initialCategories={categoriesData || []}
        />
    );
}
