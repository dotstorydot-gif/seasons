"use client";

import React, { useState } from 'react';
import styles from './Cart.module.css';
import { Trash2, ChevronLeft } from 'lucide-react';
import Link from 'next/link';

const DUMMY_CART = [
    { id: '1', name: 'Serene Lounge Chair', price: 4500, quantity: 1, image: '' },
    { id: '2', name: 'Oak Coffee Table', price: 3200, quantity: 1, image: '' },
];

export default function CartPage() {
    const [items, setItems] = useState(DUMMY_CART);

    const subtotal = items.reduce((acc, item) => acc + (item.price * item.quantity), 0);
    const deliveryFee = 150;
    const total = subtotal + deliveryFee;

    const updateQuantity = (id: string, delta: number) => {
        setItems(items.map(item =>
            item.id === id ? { ...item, quantity: Math.max(1, item.quantity + delta) } : item
        ));
    };

    const removeItem = (id: string) => {
        setItems(items.filter(item => item.id !== id));
    };

    return (
        <div className={styles.cartPage}>
            <div className={styles.container}>
                <h1 className={styles.title}>Your Shopping Bag</h1>

                <div className={styles.layout}>
                    <div className={styles.main}>
                        {items.length > 0 ? (
                            <div className={styles.itemList}>
                                {items.map(item => (
                                    <div key={item.id} className={styles.item}>
                                        <div className={styles.imagePlaceholder} style={{ backgroundColor: '#E5E1DA' }}></div>
                                        <div className={styles.itemInfo}>
                                            <h3>{item.name}</h3>
                                            <p className={styles.itemPrice}>{item.price} EGP</p>
                                        </div>
                                        <div className={styles.quantity}>
                                            <button onClick={() => updateQuantity(item.id, -1)}>-</button>
                                            <span>{item.quantity}</span>
                                            <button onClick={() => updateQuantity(item.id, 1)}>+</button>
                                        </div>
                                        <div className={styles.subtotal}>
                                            {item.price * item.quantity} EGP
                                        </div>
                                        <button onClick={() => removeItem(item.id)} className={styles.remove}>
                                            <Trash2 size={18} />
                                        </button>
                                    </div>
                                ))}
                            </div>
                        ) : (
                            <div className={styles.empty}>
                                <p>Your bag is currently empty.</p>
                                <Link href="/shop" className="premium-button">Continue Shopping</Link>
                            </div>
                        )}

                        <Link href="/shop" className={styles.back}>
                            <ChevronLeft size={16} />
                            Continue Shopping
                        </Link>
                    </div>

                    <aside className={styles.summary}>
                        <h2>Order Summary</h2>
                        <div className={styles.summaryRow}>
                            <span>Subtotal</span>
                            <span>{subtotal} EGP</span>
                        </div>
                        <div className={styles.summaryRow}>
                            <span>Estimated Delivery</span>
                            <span>{deliveryFee} EGP</span>
                        </div>
                        <div className={`${styles.summaryRow} ${styles.total}`}>
                            <span>Total</span>
                            <span>{total} EGP</span>
                        </div>
                        <Link href="/checkout" className="premium-button" style={{ width: '100%', textAlign: 'center' }}>
                            Proceed to Checkout
                        </Link>
                        <p className={styles.summaryNote}>COD Payment only. Taxes included.</p>
                    </aside>
                </div>
            </div>
        </div>
    );
}
