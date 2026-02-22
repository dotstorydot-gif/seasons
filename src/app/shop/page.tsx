"use client";

import React, { useState, useEffect } from 'react';
import ProductCard from '@/components/ui/ProductCard';
import styles from './Shop.module.css';
import { Search } from 'lucide-react';
import { useSearchParams } from 'next/navigation';
import { supabase } from '@/lib/supabase';

export default function ShopPage() {
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

    const filteredProducts = products.filter(p => {
        const matchesSearch = (p.name_en?.toLowerCase() || '').includes(search.toLowerCase()) ||
            (p.name_ar || '').includes(search);
        const matchesCategory = activeCategory === 'All' || p.category_id === activeCategory;
        return matchesSearch && matchesCategory;
    });

    return (
        <div className={styles.shop}>
            <header className={styles.header}>
                <div className={styles.container}>
                    <h1>Our Collection</h1>
                    <p>Carefully curated pieces for your home.</p>
                </div>
            </header>

            <div className={styles.controls}>
                <div className={styles.container}>
                    <div className={styles.filters}>
                        <button
                            className={activeCategory === 'All' ? styles.active : ''}
                            onClick={() => setActiveCategory('All')}
                        >
                            All
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

                    <div className={styles.search}>
                        <Search size={20} />
                        <input
                            type="text"
                            placeholder="Search products..."
                            value={search}
                            onChange={(e) => setSearch(e.target.value)}
                        />
                    </div>
                </div>
            </div>

            <main className={styles.container}>
                {loading ? (
                    <div className={styles.loading}>Loading pieces...</div>
                ) : (
                    <div className={styles.grid}>
                        {filteredProducts.map(product => (
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
                )}
            </main>
        </div>
    );
}
