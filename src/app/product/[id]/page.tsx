"use client";

import React, { useState, useEffect } from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './ProductPage.module.css';
import { MessageCircle, Share2, ChevronLeft, ChevronRight, Loader2 } from 'lucide-react';
import Link from 'next/link';
import { supabase } from '@/lib/supabase';

export default function ProductPage({ params }: { params: Promise<{ id: string }> }) {
    const { language, t } = useLanguage();
    const [product, setProduct] = useState<any>(null);
    const [quantity, setQuantity] = useState(1);
    const [activeImage, setActiveImage] = useState(0);
    const [loading, setLoading] = useState(true);

    const fetchProduct = async (id: string) => {
        setLoading(true);
        const { data, error } = await supabase
            .from('products')
            .select('*, categories(name_en, name_ar)')
            .eq('id', id)
            .single();

        if (data) setProduct(data);
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
                        <p className={styles.price}>{product.price} EGP</p>

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
                            <button className="premium-button" style={{ flex: 1 }}>Add to Cart</button>
                        </div>

                        <div className={styles.secondaryActions}>
                            <a href={whatsappUrl} target="_blank" rel="noopener noreferrer" className={styles.whatsappOrder}>
                                <MessageCircle size={20} />
                                Order via WhatsApp
                            </a>
                            <button
                                className={styles.quickAdd}
                                onClick={(e) => {
                                    e.preventDefault();
                                    e.stopPropagation();
                                    // Add to cart logic here
                                    alert(`${name} added to cart!`);
                                }}
                            >
                                Quick Add
                            </button>
                            <button className={styles.shareButton}>
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
