"use client";

import React, { useState } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import styles from './ProductCard.module.css';
import { useLanguage } from '@/context/LanguageContext';
import { useCart } from '@/context/CartContext';
import { useWishlist } from '@/context/WishlistContext';
import { useToast } from '@/context/ToastContext';
import { Heart } from 'lucide-react';

interface Product {
    id: string;
    nameEn: string;
    nameAr: string;
    price: number;
    image: string;
    images?: string[];
    categoryEn: string;
    categoryAr: string;
    sku?: string;
    compareAtPrice?: number | null;
}

const ProductCard: React.FC<{ product: Product }> = ({ product }) => {
    const { language } = useLanguage();
    const { addItem } = useCart();
    const { isWishlisted, toggle } = useWishlist();
    const { showToast } = useToast();
    const [hovered, setHovered] = useState(false);

    const name = language === 'en' ? product.nameEn : product.nameAr;
    const category = language === 'en' ? product.categoryEn : product.categoryAr;

    const mainImage = (product.images && product.images[0]) || product.image;
    const hoverImage = product.images && product.images[1];
    const wishlisted = isWishlisted(product.id);

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
                        <Image
                            src={mainImage}
                            alt={name}
                            fill
                            className={`${styles.image} ${hovered && hoverImage ? styles.imageHidden : ''}`}
                            style={{ objectFit: 'cover' }}
                        />
                        {hoverImage && (
                            <Image
                                src={hoverImage}
                                alt={`${name} — alternate`}
                                fill
                                className={`${styles.image} ${styles.imageHover} ${hovered ? styles.imageHoverVisible : ''}`}
                                style={{ objectFit: 'cover' }}
                            />
                        )}
                    </>
                ) : (
                    <div className={styles.placeholderImage} style={{ backgroundColor: '#E5E1DA' }} />
                )}

                {/* Wishlist heart */}
                <button
                    className={`${styles.wishlistBtn} ${wishlisted ? styles.wishlisted : ''}`}
                    onClick={(e) => {
                        e.preventDefault(); e.stopPropagation();
                        toggle({ id: product.id, nameEn: product.nameEn, nameAr: product.nameAr, price: product.price, image: mainImage, sku: product.sku });
                        showToast(
                            wishlisted
                                ? (language === 'en' ? 'Removed from wishlist' : 'تمت الإزالة من الأمنيات')
                                : (language === 'en' ? 'Added to wishlist ❤️' : 'أضيف إلى قائمة الأمنيات'),
                            'wishlist'
                        );
                    }}
                    aria-label="Wishlist"
                >
                    <Heart size={16} fill={wishlisted ? '#B8945A' : 'none'} />
                </button>

                {/* Add to cart */}
                <button
                    className={styles.quickAdd}
                    onClick={(e) => {
                        e.preventDefault(); e.stopPropagation();
                        addItem(product);
                        showToast(language === 'en' ? '1 item added to cart 🛒' : 'تمت الإضافة إلى السلة', 'cart');
                    }}
                >
                    {language === 'en' ? 'Add to Cart' : 'أضف للسلة'}
                </button>
            </div>
            <div className={styles.info}>
                <span className={styles.category}>{category}</span>
                <h3 className={styles.name}>{name}</h3>
                <div className={styles.priceRow}>
                    {product.compareAtPrice && product.compareAtPrice > product.price && (
                        <span className={styles.originalPrice}>{product.compareAtPrice} EGP</span>
                    )}
                    <p className={styles.price}>{product.price} EGP</p>
                </div>
            </div>
        </Link>
    );
};

export default ProductCard;
