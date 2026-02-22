"use client";

import React, { useState } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { useLanguage } from '@/context/LanguageContext';
import { useCart } from '@/context/CartContext';
import styles from './Cart.module.css';
import { Trash2, ChevronLeft, Minus, Plus, ClipboardList, Truck, Tag } from 'lucide-react';

const SHIPPING_FEE = 30;

export default function CartPage() {
    const { language } = useLanguage();
    const { items, removeItem, updateQuantity, total, orderNote, setOrderNote } = useCart();
    const [activeAction, setActiveAction] = useState<'note' | 'shipping' | 'coupon' | null>(null);
    const [tempNote, setTempNote] = useState(orderNote);

    const finalTotal = total + (items.length > 0 ? SHIPPING_FEE : 0);

    const handleSaveNote = () => {
        setOrderNote(tempNote);
        setActiveAction(null);
    };

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
                                                ? <Image src={item.image} alt={name} width={80} height={100} className={styles.thumb} />
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
                        <div className={styles.actionToolbar}>
                            <button
                                className={`${styles.actionBtn} ${activeAction === 'note' ? styles.active : ''}`}
                                onClick={() => setActiveAction(activeAction === 'note' ? null : 'note')}
                                title={language === 'en' ? "Add Order Note" : "إضافة ملاحظة للطلب"}
                            >
                                <ClipboardList size={22} strokeWidth={1.5} />
                            </button>
                            <button
                                className={`${styles.actionBtn} ${activeAction === 'shipping' ? styles.active : ''}`}
                                onClick={() => setActiveAction(activeAction === 'shipping' ? null : 'shipping')}
                                title={language === 'en' ? "Estimate Shipping" : "حساب الشحن"}
                            >
                                <Truck size={22} strokeWidth={1.5} />
                            </button>
                            <button
                                className={`${styles.actionBtn} ${activeAction === 'coupon' ? styles.active : ''}`}
                                onClick={() => setActiveAction(activeAction === 'coupon' ? null : 'coupon')}
                                title={language === 'en' ? "Add Coupon" : "إضافة كوبون"}
                            >
                                <Tag size={22} strokeWidth={1.5} />
                            </button>
                        </div>

                        {activeAction === 'note' && (
                            <div className={styles.actionContent}>
                                <div className={styles.actionHeader}>{language === 'en' ? 'Add Order Note' : 'إضافة ملاحظة للطلب'}</div>
                                <div className={styles.actionSubtext}>{language === 'en' ? 'How can we help you?' : 'كيف يمكننا مساعدتك؟'}</div>
                                <textarea
                                    className={styles.noteTextarea}
                                    value={tempNote}
                                    onChange={(e) => setTempNote(e.target.value)}
                                    placeholder={language === 'en' ? 'Special instructions for delivery...' : 'تعليمات خاصة للتوصيل...'}
                                />
                                <div className={styles.actionFooter}>
                                    <button className={styles.saveBtn} onClick={handleSaveNote}>{language === 'en' ? 'Save' : 'حفظ'}</button>
                                    <button className={styles.cancelBtn} onClick={() => setActiveAction(null)}>{language === 'en' ? 'Cancel' : 'إلغاء'}</button>
                                </div>
                            </div>
                        )}

                        {activeAction === 'shipping' && (
                            <div className={styles.actionContent}>
                                <div className={styles.actionHeader}>{language === 'en' ? 'Estimate Shipping' : 'حساب الشحن'}</div>
                                <div className={styles.actionSubtext}>{language === 'en' ? 'Enter your destination to get a shipping estimate.' : 'أدخل وجهتك للحصول على تقدير الشحن.'}</div>
                                <div style={{ display: 'flex', flexDirection: 'column', gap: '16px', marginBottom: '24px' }}>
                                    <select className={styles.noteTextarea} style={{ minHeight: 'auto', marginBottom: 0 }}>
                                        <option value="EG">Egypt</option>
                                    </select>
                                    <select className={styles.noteTextarea} style={{ minHeight: 'auto', marginBottom: 0 }}>
                                        <option value="Cairo">Cairo</option>
                                        <option value="Giza">Giza</option>
                                        <option value="Alexandria">Alexandria</option>
                                        <option value="Other">Other Governorates</option>
                                    </select>
                                </div>
                                <div className={styles.actionFooter}>
                                    <button className={styles.saveBtn} onClick={() => setActiveAction(null)}>{language === 'en' ? 'Calculate' : 'احسب'}</button>
                                    <button className={styles.cancelBtn} onClick={() => setActiveAction(null)}>{language === 'en' ? 'Cancel' : 'إلغاء'}</button>
                                </div>
                            </div>
                        )}

                        {activeAction === 'coupon' && (
                            <div className={styles.actionContent}>
                                <div className={styles.actionHeader}>{language === 'en' ? 'Add a Coupon' : 'إضافة كوبون'}</div>
                                <div className={styles.actionSubtext}>{language === 'en' ? 'Coupon code will work on checkout page' : 'سيعمل رمز الكوبون في صفحة الدفع'}</div>
                                <input
                                    type="text"
                                    className={styles.noteTextarea}
                                    style={{ minHeight: 'auto' }}
                                    placeholder={language === 'en' ? 'Coupon code' : 'رمز الكوبون'}
                                />
                                <div className={styles.actionFooter}>
                                    <button className={styles.saveBtn} onClick={() => setActiveAction(null)}>{language === 'en' ? 'Save' : 'حفظ'}</button>
                                    <button className={styles.cancelBtn} onClick={() => setActiveAction(null)}>{language === 'en' ? 'Cancel' : 'إلغاء'}</button>
                                </div>
                            </div>
                        )}



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
