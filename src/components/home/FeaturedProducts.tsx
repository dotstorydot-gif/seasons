"use client";

import React from 'react';
import ProductCard from '../ui/ProductCard';
import styles from './FeaturedProducts.module.css';

const DUMMY_PRODUCTS = [
    {
        id: '1',
        nameEn: 'Serene Lounge Chair',
        nameAr: 'كرسي استرخاء هادئ',
        price: 4500,
        image: '',
        categoryEn: 'Seating',
        categoryAr: 'كراسي'
    },
    {
        id: '2',
        nameEn: 'Oak Coffee Table',
        nameAr: 'طاولة قهوة بلوط',
        price: 3200,
        image: '',
        categoryEn: 'Tables',
        categoryAr: 'طاولات'
    },
    {
        id: '3',
        nameEn: 'Minimalist Floor Lamp',
        nameAr: 'مصباح أرضي بسيط',
        price: 1800,
        image: '',
        categoryEn: 'Lighting',
        categoryAr: 'إضاءة'
    },
    {
        id: '4',
        nameEn: 'Pure Linen Sofa',
        nameAr: 'أريكة كتان خالص',
        price: 12000,
        image: '',
        categoryEn: 'Seating',
        categoryAr: 'كراسي'
    }
];

const FeaturedProducts = () => {
    return (
        <section className={styles.featured}>
            <div className={styles.container}>
                <div className={styles.header}>
                    <h2 className={styles.title}>Featured Pieces</h2>
                    <p className={styles.subtitle}>Curated for a calm and organic home.</p>
                </div>
                <div className={styles.grid}>
                    {DUMMY_PRODUCTS.map(product => (
                        <ProductCard key={product.id} product={product} />
                    ))}
                </div>
            </div>
        </section>
    );
};

export default FeaturedProducts;
