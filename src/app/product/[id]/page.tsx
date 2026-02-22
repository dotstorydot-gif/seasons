"use client";

import React, { useState, useEffect } from 'react';
import { useLanguage } from '@/context/LanguageContext';
import { useCart } from '@/context/CartContext';
import { useWishlist } from '@/context/WishlistContext';
import { useToast } from '@/context/ToastContext';
import styles from './ProductPage.module.css';
import { MessageCircle, Share2, ChevronLeft, ChevronRight, Loader2, Heart } from 'lucide-react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase';

export default function ProductPage({ params }: { params: Promise<{ id: string }> }) {
    const { language, t } = useLanguage();
    const { addItem } = useCart();
    const { isWishlisted, toggle } = useWishlist();
    const { showToast } = useToast();
    const [product, setProduct] = useState<any>(null);
    const [quantity, setQuantity] = useState(1);
    const [activeImage, setActiveImage] = useState(0);
    const [loading, setLoading] = useState(true);

    const fetchProduct = async (id: string) => {
        setLoading(true);
        console.log('Fetching product with ID:', id);
        const { data, error } = await supabase
            .from('products')
            .select('*, categories(name_en, name_ar)')
            .eq('id', id)
            .single();

        if (error) {
            console.error('Supabase error fetching product:', error);
        }

        if (data) {
            console.log('Product data fetched successfully:', data);
            setProduct(data);
        } else {
            console.warn('No product found for ID:', id);
        }
        setLoading(false);
    };

    useEffect(() => {
        const loadParams = async () => {
            const resolvedParams = await params;
            fetchProduct(resolvedParams.id);
        };
        loadParams();
    }, [params]);

    if (loading) return <div className={styles.loadingState}><Loader2 className={styles.spinner} /></div>;
    if (!product) return <div className={styles.errorState}>Product not found</div>;

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
                                <img src={product.images[activeImage]} alt={name} className={styles.mainImage} />
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
                                    <img src={img} alt={`${name} ${i}`} />
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
                                    toggle({ id: product.id, nameEn: product.name_en, nameAr: product.name_ar, price: product.price, image: product.images?.[0] || product.image_url || '', sku: product.sku });
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
