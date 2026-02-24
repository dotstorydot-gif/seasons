"use client";

import React, { useState, Suspense } from 'react';
import ProductCard from '@/components/ui/ProductCard';
import styles from './Shop.module.css';
import { Search } from 'lucide-react';
import { useSearchParams, useRouter } from 'next/navigation';

interface ShopProduct {
    id: string;
    name_en: string;
    name_ar: string;
    price: number;
    category_id: string;
    image_url?: string;
    images?: string[];
}

interface ShopCategory {
    id: string;
    name_en: string;
    name_ar: string;
}

interface ShopClientProps {
    initialProducts: ShopProduct[];
    initialCategories: ShopCategory[];
}

const ShopContent = ({ initialProducts, initialCategories }: ShopClientProps) => {
    const searchParams = useSearchParams();
    const router = useRouter();
    const categoryParam = searchParams.get('category') || 'All';

    const [products] = useState<ShopProduct[]>(initialProducts);
    const [categories] = useState<ShopCategory[]>(initialCategories);
    const [search, setSearch] = useState('');

    const filteredProducts = products.filter(p => {
        const nameEn = p.name_en?.toLowerCase() || '';
        const nameAr = p.name_ar || '';
        const matchesSearch = nameEn.includes(search.toLowerCase()) || nameAr.includes(search);
        const matchesCategory = categoryParam === 'All' || p.category_id === categoryParam;
        return matchesSearch && matchesCategory;
    });

    const handleCategoryChange = (catId: string) => {
        if (catId === 'All') {
            router.push('/shop');
        } else {
            router.push(`/shop?category=${catId}`);
        }
    };

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
                                className={categoryParam === 'All' ? styles.active : ''}
                                onClick={() => handleCategoryChange('All')}
                            >
                                All Products
                            </button>
                            {categories.map(cat => (
                                <button
                                    key={cat.id}
                                    className={categoryParam === cat.id ? styles.active : ''}
                                    onClick={() => handleCategoryChange(cat.id)}
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
                    {filteredProducts.length > 0 ? (
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
                                            image: (product.images?.[0]) || product.image_url || '',
                                            images: product.images || [],
                                        }}
                                    />
                                );
                            })}
                        </div>
                    ) : (
                        <div className={styles.noResults}>
                            <h3>No items found</h3>
                            <p>We couldn&apos;t find any items matching your selected criteria. Try adjusting your filters or search.</p>
                        </div>
                    )}
                </div>
            </main>
        </div>
    );
};

export default function ShopClient({ initialProducts, initialCategories }: ShopClientProps) {
    return (
        <Suspense fallback={<div className={styles.loading}>Curating collection...</div>}>
            <ShopContent initialProducts={initialProducts} initialCategories={initialCategories} />
        </Suspense>
    );
}
