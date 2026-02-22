"use client";

import React, { useState } from 'react';
import Link from 'next/link';
import styles from './ProductCard.module.css';
import { useLanguage } from '@/context/LanguageContext';
import { useCart } from '@/context/CartContext';

interface Product {
    id: string;
    nameEn: string;
    nameAr: string;
    price: number;
    image: string;
    images?: string[];   // full array: [0]=main, [1]=hover, [2..]=gallery
    categoryEn: string;
    categoryAr: string;
}

const ProductCard: React.FC<{ product: Product }> = ({ product }) => {
    const { language } = useLanguage();
    const { addItem } = useCart();
    const [hovered, setHovered] = useState(false);

    const name = language === 'en' ? product.nameEn : product.nameAr;
    const category = language === 'en' ? product.categoryEn : product.categoryAr;

    // Use images array if available, fallback to single image
    const mainImage = (product.images && product.images[0]) || product.image;
    const hoverImage = product.images && product.images[1];

    const displayImage = hovered && hoverImage ? hoverImage : mainImage;

    return (
        <Link
            href={`/product/${product.id}`}
            className={styles.card}
            onMouseEnter={() => setHovered(true)}
            onMouseLeave={() => setHovered(false)}
        >
            <div className={styles.imageWrapper}>
                {mainImage ? (
                    <>
                        {/* Main image — always rendered */}
                        <img
                            src={mainImage}
                            alt={name}
                            className={`${styles.image} ${hovered && hoverImage ? styles.imageHidden : ''}`}
                        />
                        {/* Hover image — pre-loaded, fades in */}
                        {hoverImage && (
                            <img
                                src={hoverImage}
                                alt={`${name} — alternate view`}
                                className={`${styles.image} ${styles.imageHover} ${hovered ? styles.imageHoverVisible : ''}`}
                            />
                        )}
                    </>
                ) : (
                    <div className={styles.placeholderImage} style={{ backgroundColor: '#E5E1DA' }}></div>
                )}
                <button
                    className={styles.quickAdd}
                    onClick={(e) => {
                        e.preventDefault();
                        e.stopPropagation();
                        addItem(product);
                    }}
                >
                    Add to Cart
                </button>
            </div>
            <div className={styles.info}>
                <span className={styles.category}>{category}</span>
                <h3 className={styles.name}>{name}</h3>
                <p className={styles.price}>{product.price} EGP</p>
            </div>
        </Link>
    );
};

export default ProductCard;
