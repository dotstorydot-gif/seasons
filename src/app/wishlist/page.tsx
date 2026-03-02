"use client";

import React from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { useLanguage } from '@/context/LanguageContext';
import { useWishlist } from '@/context/WishlistContext';
import { useCart } from '@/context/CartContext';
import { useToast } from '@/context/ToastContext';
import styles from './Wishlist.module.css';
import { Heart, ShoppingBag, Trash2, ShoppingCart } from 'lucide-react';
import EmptyState from '@/components/ui/EmptyState';

export default function WishlistPage() {
    const { language } = useLanguage();
    const { items, removeItem } = useWishlist();
    const { addItem } = useCart();
    const { showToast } = useToast();

    const handleAddToCart = (item: typeof items[0]) => {
        addItem({ id: item.id, nameEn: item.nameEn, nameAr: item.nameAr, price: item.price, image: item.image, sku: item.sku });
        showToast(language === 'en' ? '1 item added to cart' : 'تمت الإضافة إلى السلة', 'cart');
    };

    return (
        <div className={styles.page}>
            <div className={styles.container}>
                <header className={styles.header}>
                    <h1>{language === 'en' ? 'My Wishlist' : 'قائمة الأمنيات'}</h1>
                    <p className={styles.subtitle}>
                        {items.length} {language === 'en' ? 'saved items' : 'عنصر محفوظ'}
                    </p>
                </header>

                {items.length === 0 ? (
                    <EmptyState
                        icon={Heart}
                        title={language === 'en' ? 'Your Wishlist is Empty' : 'قائمة الأمنيات فارغة'}
                        description={language === 'en' ? 'Save items you love to find them easily later.' : 'احفظ المنتجات التي تحبها لتجدها بسهولة لاحقاً.'}
                        actionLabel={language === 'en' ? 'Start Shopping' : 'ابدأ التسوق'}
                        actionHref="/shop"
                    />
                ) : (
                    <div className={styles.grid}>
                        {items.map(item => {
                            const name = language === 'en' ? item.nameEn : item.nameAr;
                            return (
                                <div key={item.id} className={styles.card}>
                                    <Link href={`/product/${item.id}`} className={styles.imageLink}>
                                        {item.image
                                            ? (
                                                <div style={{ position: 'relative', width: '100%', height: '100%' }}>
                                                    <Image
                                                        src={item.image}
                                                        alt={name}
                                                        fill
                                                        className={styles.image}
                                                        style={{ objectFit: 'cover' }}
                                                    />
                                                </div>
                                            )
                                            : <div className={styles.placeholder} />
                                        }
                                    </Link>
                                    <div className={styles.info}>
                                        <h3 className={styles.name}>{name}</h3>
                                        <p className={styles.price}>{item.price} EGP</p>
                                        <div className={styles.actions}>
                                            <button className={styles.addBtn} onClick={() => handleAddToCart(item)}>
                                                <ShoppingBag size={15} />
                                                {language === 'en' ? 'Add to Cart' : 'أضف للسلة'}
                                            </button>
                                            <button className={styles.removeBtn} onClick={() => removeItem(item.id)} title="Remove">
                                                <Trash2 size={15} />
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                )}
            </div>
        </div>
    );
}
