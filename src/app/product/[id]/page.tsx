import React from 'react';
import { Metadata } from 'next';
import { supabase } from '@/lib/supabase';
import ProductClient from './ProductClient';
import { notFound } from 'next/navigation';

export async function generateMetadata({ params }: { params: Promise<{ id: string }> }): Promise<Metadata> {
    const { id } = await params;
    const { data: product } = await supabase.from('products').select('*').eq('id', id).single();

    if (!product) return { title: 'Product Not Found' };

    return {
        title: product.name_en,
        description: product.description_en?.substring(0, 160),
        openGraph: {
            title: product.name_en,
            description: product.description_en?.substring(0, 160),
            images: product.images?.[0] ? [{ url: product.images[0] }] : [],
        },
    };
}

export default async function ProductPage({ params }: { params: Promise<{ id: string }> }) {
    const { id } = await params;
    const { data: product } = await supabase
        .from('products')
        .select('*, categories(name_en, name_ar)')
        .eq('id', id)
        .single();

    if (!product) notFound();

    // Structured Data for SEO
    const jsonLd = {
        '@context': 'https://schema.org',
        '@type': 'Product',
        name: product.name_en,
        image: product.images?.[0],
        description: product.description_en,
        sku: product.sku,
        offers: {
            '@type': 'Offer',
            price: product.price,
            priceCurrency: 'EGP',
            availability: product.stock > 0 ? 'https://schema.org/InStock' : 'https://schema.org/OutOfStock',
        },
    };

    return (
        <>
            <script
                type="application/ld+json"
                dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
            />
            <ProductClient product={product} />
        </>
    );
}
