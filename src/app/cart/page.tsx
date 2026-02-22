"use client";

import React from 'react';
import Link from 'next/link';
import { useLanguage } from '@/context/LanguageContext';
import { useCart } from '@/context/CartContext';
import styles from './Cart.module.css';
import { Trash2, ChevronLeft, Minus, Plus } from 'lucide-react';

const SHIPPING_FEE = 30;

export default function CartPage() {
    const { language } = useLanguage();
    const { items, removeItem, updateQuantity, total } = useCart();

    const finalTotal = total + (items.length > 0 ? SHIPPING_FEE : 0);

    if (items.length === 0) {
        return (
            <div className={styles.cartPage}>
                <div className={styles.container}>
                    <h1 className={styles.title}>{language === 'en' ? 'Your Bag' : 'حقيبتك'}</h1>
                    <div className={styles.empty}>
                        <p>{language === 'en' ? 'Your bag is empty.' : 'حقيبتك فارغة.'}</p>
                        <Link href="/shop" className="premium-button">
                            {language === 'en' ? 'Continue Shopping' : 'تابع التسوق'}
                        </Link>
                    </div>
                </div>
            </div>
        );
    }

    return (
        <div className={styles.cartPage}>
            <div className={styles.container}>
                <h1 className={styles.title}>{language === 'en' ? 'Your Bag' : 'حقيبتك'}</h1>

                <div className={styles.layout}>
                    <div className={styles.main}>
                        <div className={styles.itemList}>
                            {items.map(item => {
                                const name = language === 'en' ? item.nameEn : item.nameAr;
                                return (
                                    <div key={item.id} className={styles.item}>
                                        <div className={styles.thumbWrapper}>
                                            {item.image
                                                ? <img src={item.image} alt={name} className={styles.thumb} />
                                                : <div className={styles.thumbPlaceholder} />
                                            }
                                        </div>
                                        <div className={styles.itemInfo}>
                                            <h3 className={styles.itemName}>{name}</h3>
                                            {item.sku && <p className={styles.itemSku}>SKU: {item.sku}</p>}
                                            <p className={styles.itemPrice}>{item.price} EGP</p>
                                        </div>
                                        <div className={styles.quantity}>
                                            <button onClick={() => updateQuantity(item.id, item.quantity - 1)} disabled={item.quantity <= 1}>
                                                <Minus size={14} />
                                            </button>
                                            <span>{item.quantity}</span>
                                            <button onClick={() => updateQuantity(item.id, item.quantity + 1)}>
                                                <Plus size={14} />
                                            </button>
                                        </div>
                                        <div className={styles.subtotal}>
                                            {(item.price * item.quantity).toLocaleString()} EGP
                                        </div>
                                        <button onClick={() => removeItem(item.id)} className={styles.remove} title="Remove">
                                            <Trash2 size={16} />
                                        </button>
                                    </div>
                                );
                            })}
                        </div>
                        <Link href="/shop" className={styles.back}>
                            <ChevronLeft size={16} />
                            {language === 'en' ? 'Continue Shopping' : 'تابع التسوق'}
                        </Link>
                    </div>

                    <aside className={styles.summary}>
                        <h2>{language === 'en' ? 'Order Summary' : 'ملخص الطلب'}</h2>
                        <div className={styles.summaryRow}>
                            <span>{language === 'en' ? 'Subtotal' : 'المجموع'}</span>
                            <span>{total.toLocaleString()} EGP</span>
                        </div>
                        <div className={styles.summaryRow}>
                            <span>{language === 'en' ? 'Shipping' : 'الشحن'}</span>
                            <span>{SHIPPING_FEE} EGP</span>
                        </div>
                        <div className={`${styles.summaryRow} ${styles.totalRow}`}>
                            <span>{language === 'en' ? 'Total' : 'الإجمالي'}</span>
                            <span>{finalTotal.toLocaleString()} EGP</span>
                        </div>
                        <Link href="/checkout" className="premium-button" style={{ width: '100%', textAlign: 'center', marginTop: '8px' }}>
                            {language === 'en' ? 'Proceed to Checkout' : 'إتمام الشراء'}
                        </Link>
                        <p className={styles.summaryNote}>
                            {language === 'en' ? 'Cash on delivery. Taxes included.' : 'الدفع عند الاستلام. الضرائب مشمولة.'}
                        </p>
                    </aside>
                </div>
            </div>
        </div>
    );
}
