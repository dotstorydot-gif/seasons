"use client";

import React, { useState, useEffect } from 'react';
import ProductCard from '../ui/ProductCard';
import styles from './FeaturedProducts.module.css';
import { supabase } from '@/lib/supabase';

const FeaturedProducts = () => {
    const [products, setProducts] = useState<any[]>([]);
    const [categories, setCategories] = useState<any[]>([]);

    useEffect(() => {
        const fetchData = async () => {
            const { data: catData } = await supabase.from('categories').select('*');
            const { data: prodData } = await supabase.from('products')
                .select('*')
                .eq('is_featured', true)
                .limit(4);

            if (catData) setCategories(catData);
            if (prodData) setProducts(prodData);
        };
        fetchData();
    }, []);

    return (
        <section className={styles.featured}>
            <div className={styles.container}>
                <div className={styles.header}>
                    <h2 className={styles.title}>Featured Pieces</h2>
                    <p className={styles.subtitle}>Curated for a calm and organic home.</p>
                </div>
                <div className={styles.grid}>
                    {products.map(product => (
                        <ProductCard
                            key={product.id}
                            product={{
                                id: product.id,
                                nameEn: product.name_en,
                                nameAr: product.name_ar,
                                price: product.price,
                                categoryEn: categories.find(c => c.id === product.category_id)?.name_en || '',
                                categoryAr: categories.find(c => c.id === product.category_id)?.name_ar || '',
                                image: product.images?.[0] || ''
                            }}
                        />
                    ))}
                </div>
            </div>
        </section>
    );
};

export default FeaturedProducts;
