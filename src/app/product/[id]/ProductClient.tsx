"use client";

import React, { useState } from 'react';
import { useLanguage } from '@/context/LanguageContext';
import { useCart } from '@/context/CartContext';
import { useWishlist } from '@/context/WishlistContext';
import { useToast } from '@/context/ToastContext';
import styles from './ProductPage.module.css';
import { MessageCircle, Share2, ChevronLeft, ChevronRight, Heart } from 'lucide-react';
import Link from 'next/link';

import Image from 'next/image';

interface Product {
    id: string;
    name_en: string;
    name_ar: string;
    description_en: string;
    description_ar: string;
    price: number;
    compare_at_price: number | null;
    sku: string;
    stock: number;
    images: string[];
}

interface ProductClientProps {
    product: Product;
}

export default function ProductClient({ product }: ProductClientProps) {
    const { language, t } = useLanguage();
    const { addItem } = useCart();
    const { isWishlisted, toggle } = useWishlist();
    const { showToast } = useToast();
    const [quantity, setQuantity] = useState(1);
    const [activeImage, setActiveImage] = useState(0);

    const name = language === 'en' ? product.name_en : product.name_ar;
    const shortDesc = language === 'en' ? product.description_en?.substring(0, 100) : product.description_ar?.substring(0, 100);
    const description = language === 'en' ? product.description_en : product.description_ar;

    const whatsappMessage = `New Order Inquiry:\nProduct: ${product.name_en}\nSKU: ${product.sku}\nQuantity: ${quantity}\nPrice: ${product.price} EGP`;
    const whatsappUrl = `https://wa.me/201234567890?text=${encodeURIComponent(whatsappMessage)}`;

    return (
        <div className={styles.productPage}>
            <div className={styles.container}>
                <nav className={styles.breadcrumb}>
                    <Link href="/shop">{t('nav.shop')}</Link> / {name}
                </nav>

                <div className={styles.layout}>
                    <div className={styles.gallery}>
                        <div className={styles.mainImageWrapper}>
                            {product.images?.[activeImage] ? (
                                <Image
                                    src={product.images[activeImage]}
                                    alt={name}
                                    width={600}
                                    height={700}
                                    className={styles.mainImage}
                                    priority={true}
                                />
                            ) : (
                                <div className={styles.placeholderMain} style={{ backgroundColor: '#E5E1DA' }}></div>
                            )}
                            <div className={styles.galleryNav}>
                                <button onClick={() => setActiveImage(prev => (prev > 0 ? prev - 1 : (product.images?.length || 1) - 1))}><ChevronLeft /></button>
                                <button onClick={() => setActiveImage(prev => (prev < (product.images?.length || 1) - 1 ? prev + 1 : 0))}><ChevronRight /></button>
                            </div>
                        </div>
                        <div className={styles.thumbnails}>
                            {product.images?.map((img: string, i: number) => (
                                <div
                                    key={i}
                                    className={`${styles.thumbnail} ${activeImage === i ? styles.activeThumb : ''}`}
                                    onClick={() => setActiveImage(i)}
                                >
                                    <Image src={img} alt={`${name} ${i}`} width={100} height={120} />
                                </div>
                            ))}
                        </div>
                    </div>

                    <div className={styles.info}>
                        <span className={styles.sku}>SKU: {product.sku}</span>
                        <h1 className={styles.title}>{name}</h1>
                        <div className={styles.priceContainer}>
                            {product.compare_at_price && product.compare_at_price > product.price && (
                                <span className={styles.compareAtPrice}>{product.compare_at_price} EGP</span>
                            )}
                            <p className={styles.price}>{product.price} EGP</p>
                        </div>

                        <div className={styles.shortDesc}>{shortDesc}</div>

                        <div className={styles.stockStatus}>
                            <span className={styles.pulse}></span> {product.stock > 0 ? 'In Stock' : 'Out of Stock'}
                        </div>

                        <div className={styles.actions}>
                            <div className={styles.quantity}>
                                <button onClick={() => setQuantity(Math.max(1, quantity - 1))}>-</button>
                                <span>{quantity}</span>
                                <button onClick={() => setQuantity(quantity + 1)}>+</button>
                            </div>
                            <button
                                className="premium-button"
                                style={{ flex: 1 }}
                                onClick={() => {
                                    addItem(product);
                                    showToast(language === 'en' ? '1 item added to cart 🛒' : 'تمت الإضافة إلى السلة', 'cart');
                                }}
                            >
                                Add to Cart
                            </button>
                        </div>

                        <div className={styles.secondaryActions}>
                            <a
                                href={whatsappUrl}
                                target="_blank"
                                rel="noopener noreferrer"
                                className={styles.whatsappOrder}
                            >
                                <MessageCircle size={20} />
                                Order via WhatsApp
                            </a>
                            <button
                                className={`${styles.iconBtn} ${isWishlisted(product.id) ? styles.wishlisted : ''}`}
                                type="button"
                                onClick={() => {
                                    toggle({ id: product.id, nameEn: product.name_en, nameAr: product.name_ar, price: product.price, image: product.images?.[0] || '', sku: product.sku });
                                    showToast(isWishlisted(product.id) ? 'Removed from wishlist' : 'Added to wishlist ❤️', 'wishlist');
                                }}
                                title="Wishlist"
                            >
                                <Heart size={20} fill={isWishlisted(product.id) ? '#B8945A' : 'none'} />
                            </button>
                            <button
                                className={styles.shareButton}
                                type="button"
                                onClick={async () => {
                                    const url = window.location.href;
                                    const shareData = { title: product.name_en, text: `Check out ${product.name_en} on Seasons!`, url };
                                    if (navigator.share) {
                                        try { await navigator.share(shareData); } catch { }
                                    } else {
                                        await navigator.clipboard.writeText(url);
                                        showToast('Link copied to clipboard!', 'cart');
                                    }
                                }}
                            >
                                <Share2 size={20} />
                                Share
                            </button>
                        </div>

                        <div className={styles.fullDescription}>
                            <h3>Description</h3>
                            <p>{description}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
