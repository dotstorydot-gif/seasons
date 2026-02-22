"use client";

import React, { useState, useEffect, Suspense } from 'react';
import ProductCard from '@/components/ui/ProductCard';
import styles from './Shop.module.css';
import { Search } from 'lucide-react';
import { useSearchParams } from 'next/navigation';
import { supabase } from '@/lib/supabase';

const ShopContent = () => {
    const searchParams = useSearchParams();
    const categoryParam = searchParams.get('category');

    const [products, setProducts] = useState<any[]>([]);
    const [categories, setCategories] = useState<any[]>([]);
    const [search, setSearch] = useState('');
    const [activeCategory, setActiveCategory] = useState(categoryParam || 'All');
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchData = async () => {
            setLoading(true);
            const { data: productsData } = await supabase.from('products').select('*');
            const { data: categoriesData } = await supabase.from('categories').select('*');

            if (productsData) setProducts(productsData);
            if (categoriesData) setCategories(categoriesData);
            setLoading(false);
        };
        fetchData();
    }, []);

    useEffect(() => {
        if (categoryParam) {
            setActiveCategory(categoryParam);
        }
    }, [categoryParam]);

    const filteredProducts = products.filter(p => {
        const nameEn = p.name_en?.toLowerCase() || '';
        const nameAr = p.name_ar || '';
        const matchesSearch = nameEn.includes(search.toLowerCase()) || nameAr.includes(search);
        const matchesCategory = activeCategory === 'All' || p.category_id === activeCategory;
        return matchesSearch && matchesCategory;
    });

    return (
        <div className={styles.shop}>
            <header className={styles.header}>
                <div className={styles.container}>
                    <h1 className={styles.title}>Shop Collection</h1>
                    <p className={styles.subtitle}>Carefully curated pieces for your home.</p>
                </div>
            </header>

            <div className={styles.controls}>
                <div className={styles.container}>
                    <div className={styles.toolbar}>
                        <div className={styles.filters}>
                            <button
                                className={activeCategory === 'All' ? styles.active : ''}
                                onClick={() => setActiveCategory('All')}
                            >
                                All Products
                            </button>
                            {categories.map(cat => (
                                <button
                                    key={cat.id}
                                    className={activeCategory === cat.id ? styles.active : ''}
                                    onClick={() => setActiveCategory(cat.id)}
                                >
                                    {cat.name_en}
                                </button>
                            ))}
                        </div>

                        <div className={styles.searchWrapper}>
                            <Search className={styles.searchIcon} size={18} />
                            <input
                                className={styles.searchInput}
                                type="text"
                                placeholder="Search items..."
                                value={search}
                                onChange={(e) => setSearch(e.target.value)}
                            />
                        </div>
                    </div>
                </div>
            </div>

            <main className={styles.container}>
                <div className={styles.gridSection}>
                    {loading ? (
                        <div className={styles.loading}>Loading pieces...</div>
                    ) : (
                        <div className={styles.grid}>
                            {filteredProducts.map(product => {
                                const category = categories.find(c => c.id === product.category_id);
                                return (
                                    <ProductCard
                                        key={product.id}
                                        product={{
                                            id: product.id,
                                            nameEn: product.name_en,
                                            nameAr: product.name_ar,
                                            price: product.price,
                                            categoryEn: category?.name_en || '',
                                            categoryAr: category?.name_ar || '',
                                            image: product.image_url || (product.images?.[0]) || ''
                                        }}
                                    />
                                );
                            })}
                        </div>
                    )}
                    {!loading && filteredProducts.length === 0 && (
                        <div className={styles.noResults}>
                            No items found in this category.
                        </div>
                    )}
                </div>
            </main>
        </div>
    );
};

export default function ShopPage() {
    return (
        <Suspense fallback={<div className={styles.loading}>Loading shop...</div>}>
            <ShopContent />
        </Suspense>
    );
}
