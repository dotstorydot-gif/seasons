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
    const [search, setSearch] = useState(''); // Re-added search state
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
        const matchesSearch = (p.name_en?.toLowerCase() || '').includes(search.toLowerCase()) ||
            (p.name_ar || '').includes(search);
        const matchesCategory = activeCategory === 'All' || p.category_id === activeCategory;
        return matchesSearch && matchesCategory;
    });

    return (
        <div className={styles.shopContainer}>
            <div className={styles.sidebar}>
                <h2 className={styles.sidebarTitle}>Categories</h2>
                <div className={styles.categoryFilters}>
                    <button
                        className={`${styles.categoryBtn} ${activeCategory === 'All' ? styles.active : ''}`}
                        onClick={() => setActiveCategory('All')}
                    >
                        All Products
                    </button>
                    {categories.map(cat => (
                        <button
                            key={cat.id}
                            className={`${styles.categoryBtn} ${activeCategory === cat.id ? styles.active : ''}`}
                            onClick={() => setActiveCategory(cat.id)}
                        >
                            {cat.name_en}
                        </button>
                    ))}
                </div>
            </div>

            <div className={styles.mainContent}>
                <header className={styles.header}>
                    <h1 className={styles.title}>Shop Collection</h1>
                    <div className={styles.controls}>
                        <div className={styles.searchBar}>
                            <Search size={18} />
                            <input
                                type="text"
                                placeholder="Search items..."
                                value={search}
                                onChange={(e) => setSearch(e.target.value)}
                            />
                        </div>
                    </div>
                </header>

                <div className={styles.productsGrid}>
                    {loading ? (
                        <div className={styles.loading}>Loading artifacts...</div>
                    ) : (
                        filteredProducts.map(product => (
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
                        ))
                    )}
                </div>
            </div>
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
