"use client";

import React, { useState, Suspense } from 'react';
import ProductCard from '@/components/ui/ProductCard';
import styles from './Shop.module.css';
import { Search } from 'lucide-react';
import { useSearchParams, useRouter } from 'next/navigation';
import { useLanguage } from '@/context/LanguageContext';

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
    const { t, language } = useLanguage();
    const categoryParam = searchParams.get('category') || 'All';

    const [products] = useState<ShopProduct[]>(initialProducts);
    const [categories] = useState<ShopCategory[]>(initialCategories);
    const [search, setSearch] = useState(searchParams.get('search') || '');
    const [sortOrder, setSortOrder] = useState('featured');

    const filteredAndSortedProducts = products
        .filter(p => {
            const nameEn = p.name_en?.toLowerCase() || '';
            const nameAr = p.name_ar || '';
            const matchesSearch = nameEn.includes(search.toLowerCase()) || nameAr.includes(search);
            const matchesCategory = categoryParam === 'All' || p.category_id === categoryParam;
            return matchesSearch && matchesCategory;
        })
        .sort((a, b) => {
            if (sortOrder === 'priceLow') return a.price - b.price;
            if (sortOrder === 'priceHigh') return b.price - a.price;
            if (sortOrder === 'az') {
                const nameA = language === 'en' ? a.name_en : a.name_ar;
                const nameB = language === 'en' ? b.name_en : b.name_ar;
                return (nameA || '').localeCompare(nameB || '', language);
            }
            if (sortOrder === 'za') {
                const nameA = language === 'en' ? a.name_en : a.name_ar;
                const nameB = language === 'en' ? b.name_en : b.name_ar;
                return (nameB || '').localeCompare(nameA || '', language);
            }
            return 0; // featured/default
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
                    <h1 className={styles.title}>{language === 'en' ? 'Shop Collection' : 'مجموعة المتجر'}</h1>
                    <p className={styles.subtitle}>{language === 'en' ? 'Carefully curated pieces for your home.' : 'قطع مختارة بعناية لمنزلك.'}</p>
                </div>
            </header>

            <div className={styles.controls}>
                <div className={styles.container}>
                    <div className={styles.toolbar}>
                        <div className={styles.filtersSide}>
                            <div className={styles.filters}>
                                <button
                                    className={categoryParam === 'All' ? styles.active : ''}
                                    onClick={() => handleCategoryChange('All')}
                                >
                                    {language === 'en' ? 'All Products' : 'كل المنتجات'}
                                </button>
                                {categories.map(cat => (
                                    <button
                                        key={cat.id}
                                        className={categoryParam === cat.id ? styles.active : ''}
                                        onClick={() => handleCategoryChange(cat.id)}
                                    >
                                        {language === 'en' ? cat.name_en : cat.name_ar}
                                    </button>
                                ))}
                            </div>
                        </div>

                        <div className={styles.actionsSide}>
                            <div className={styles.searchWrapper}>
                                <Search className={styles.searchIcon} size={18} />
                                <input
                                    className={styles.searchInput}
                                    type="text"
                                    placeholder={t('shop.search')}
                                    value={search}
                                    onChange={(e) => setSearch(e.target.value)}
                                />
                            </div>
                            <div className={styles.sortWrapper}>
                                <select
                                    className={styles.sortSelect}
                                    value={sortOrder}
                                    onChange={(e) => setSortOrder(e.target.value)}
                                >
                                    <option value="featured">{t('shop.sort.featured')}</option>
                                    <option value="priceLow">{t('shop.sort.priceLow')}</option>
                                    <option value="priceHigh">{t('shop.sort.priceHigh')}</option>
                                    <option value="az">{t('shop.sort.az')}</option>
                                    <option value="za">{t('shop.sort.za')}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <main className={styles.container}>
                <div className={styles.gridSection}>
                    {filteredAndSortedProducts.length > 0 ? (
                        <div className={styles.grid}>
                            {filteredAndSortedProducts.map(product => {
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
                            <h3>{t('shop.noResults')}</h3>
                            <p>{t('shop.noResults.sub')}</p>
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
