"use client";

import React from 'react';
import styles from './ProductCard.module.css';
import { useLanguage } from '@/context/LanguageContext';

interface Product {
    id: string;
    nameEn: string;
    nameAr: string;
    price: number;
    image: string;
    categoryEn: string;
    categoryAr: string;
}

const ProductCard: React.FC<{ product: Product }> = ({ product }) => {
    const { language } = useLanguage();

    const name = language === 'en' ? product.nameEn : product.nameAr;
    const category = language === 'en' ? product.categoryEn : product.categoryAr;

    return (
        <div className={styles.card}>
            <div className={styles.imageWrapper}>
                <div className={styles.placeholderImage} style={{ backgroundColor: '#E5E1DA' }}></div>
                {/* <img src={product.image} alt={name} className={styles.image} /> */}
                <button className={styles.quickAdd}>Quick Add</button>
            </div>
            <div className={styles.info}>
                <span className={styles.category}>{category}</span>
                <h3 className={styles.name}>{name}</h3>
                <p className={styles.price}>{product.price} EGP</p>
            </div>
        </div>
    );
};

export default ProductCard;
