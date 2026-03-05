"use client";

import React, { useState, useEffect, useCallback } from 'react';
import styles from './Catalogue.module.css';
import { supabase } from '@/lib/supabase';
import Image from 'next/image';
import { Loader2 } from 'lucide-react';

interface Product {
    id: string;
    name_en: string;
    name_ar: string;
    price: number;
    compare_at_price: number | null;
    category_id: string | null;
    images: string[];
    categories?: {
        name_en: string;
        name_ar: string;
    };
}

export default function AdminCataloguePage() {
    const [products, setProducts] = useState<Product[]>([]);
    const [loading, setLoading] = useState(true);

    const fetchData = useCallback(async () => {
        const { data: productsData } = await supabase
            .from('products')
            .select('*, categories(name_en, name_ar)')
            .order('name_en');

        if (productsData) setProducts(productsData as Product[]);
    }, []);

    useEffect(() => {
        const load = async () => {
            setLoading(true);
            await fetchData();
            setLoading(false);
        };
        load();
    }, [fetchData]);

    if (loading) {
        return (
            <div className={styles.loadingWrapper}>
                <Loader2 size={48} className={styles.spinner} />
            </div>
        );
    }

    return (
        <div className={styles.container}>
            <div className={styles.grid}>
                {products.map(product => {
                    // Use index 1 ("-02") if available, otherwise index 0
                    const displayImage = product.images?.[1] || product.images?.[0] || '/images/placeholder.png';
                    const categoryName = product.categories?.name_en || 'Collection';

                    return (
                        <div key={product.id} className={styles.productCard}>
                            <div className={styles.card}>
                                <div className={styles.imageWrapper}>
                                    <Image
                                        src={displayImage}
                                        alt={product.name_en}
                                        fill
                                        style={{ objectFit: 'cover' }}
                                        className={styles.productImage}
                                        unoptimized
                                    />
                                </div>
                                <div className={styles.info}>
                                    <span className={styles.category}>{categoryName}</span>
                                    <h3 className={styles.name}>{product.name_en}</h3>
                                    <div className={styles.priceRow}>
                                        {product.compare_at_price && product.compare_at_price > product.price && (
                                            <span className={styles.originalPrice}>{product.compare_at_price} EGP</span>
                                        )}
                                        <p className={styles.price}>{product.price} EGP</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    );
                })}
            </div>
        </div>
    );
}
