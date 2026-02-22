"use client";

import React, { useState } from 'react';
import styles from './Checkout.module.css';
import { ShieldCheck, Loader2 } from 'lucide-react';
import { supabase } from '@/lib/supabase';
import { useCart } from '@/context/CartContext';

export default function CheckoutPage() {
    const { items, total, clearCart } = useCart();
    const [loading, setLoading] = useState(false);
    const [formData, setFormData] = useState({
        fullName: '',
        phone: '',
        altPhone: '',
        city: '',
        area: '',
        address: '',
        notes: ''
    });

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const DELIVERY_FEE = 150;
    const finalTotal = total + DELIVERY_FEE;

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (items.length === 0) {
            alert('Your cart is empty');
            return;
        }

        setLoading(true);

        const orderNumber = `ORD-${Math.random().toString(36).substr(2, 9).toUpperCase()}`;

        const { error } = await supabase.from('orders').insert([{
            order_number: orderNumber,
            full_name: formData.fullName,
            phone: formData.phone,
            alt_phone: formData.altPhone,
            city: formData.city,
            area: formData.area,
            address: formData.address,
            delivery_notes: formData.notes,
            total_amount: finalTotal,
            status: 'pending',
            items: items.map(item => ({
                id: item.id,
                name: item.nameEn,
                price: item.price,
                quantity: item.quantity
            }))
        }]);

        if (error) {
            alert('Error placing order. Please try again.');
            console.error(error);
            setLoading(false);
        } else {
            clearCart();
            window.location.href = `/checkout/thank-you?order=${orderNumber}`;
        }
    };

    return (
        <div className={styles.checkoutPage}>
            <div className={styles.container}>
                <h1 className={styles.title}>Secure Checkout</h1>

                <form onSubmit={handleSubmit} className={styles.layout}>
                    <div className={styles.main}>
                        <section className={styles.section}>
                            <h2>Contact Information</h2>
                            <div className={styles.formGrid}>
                                <div className={styles.field}>
                                    <label>Full Name *</label>
                                    <input type="text" name="fullName" required value={formData.fullName} onChange={handleChange} placeholder="First and last name" />
                                </div>
                                <div className={styles.field}>
                                    <label>Phone Number *</label>
                                    <input type="tel" name="phone" required value={formData.phone} onChange={handleChange} placeholder="e.g. 01234567890" />
                                </div>
                                <div className={styles.field}>
                                    <label>Alternative Phone (Optional)</label>
                                    <input type="tel" name="altPhone" value={formData.altPhone} onChange={handleChange} />
                                </div>
                            </div>
                        </section>

                        <section className={styles.section}>
                            <h2>Delivery Address</h2>
                            <div className={styles.formGrid}>
                                <div className={styles.field}>
                                    <label>City *</label>
                                    <select name="city" required value={formData.city} onChange={handleChange}>
                                        <option value="">Select city</option>
                                        <option value="Cairo">Cairo</option>
                                        <option value="Giza">Giza</option>
                                        <option value="Alexandria">Alexandria</option>
                                    </select>
                                </div>
                                <div className={styles.field}>
                                    <label>Area *</label>
                                    <input type="text" name="area" required value={formData.area} onChange={handleChange} placeholder="e.g. Maadi, New Cairo" />
                                </div>
                                <div className={`${styles.field} ${styles.full}`}>
                                    <label>Detailed Address *</label>
                                    <textarea name="address" required value={formData.address} onChange={handleChange} placeholder="Building, Apartment, Street name" rows={3}></textarea>
                                </div>
                                <div className={`${styles.field} ${styles.full}`}>
                                    <label>Delivery Notes</label>
                                    <textarea name="notes" value={formData.notes} onChange={handleChange} placeholder="Special instructions for delivery" rows={2}></textarea>
                                </div>
                            </div>
                        </section>

                        <section className={styles.section}>
                            <h2>Payment Method</h2>
                            <div className={styles.paymentMethod}>
                                <input type="radio" checked readOnly />
                                <div className={styles.paymentLabel}>
                                    <strong>Cash on Delivery (COD)</strong>
                                    <span>Pay with cash when your order arrives.</span>
                                </div>
                            </div>
                        </section>
                    </div>

                    <aside className={styles.sidebar}>
                        <div className={styles.orderSummary}>
                            <h2>Your Order</h2>
                            <div className={styles.summaryRow}>
                                <span>Subtotal</span>
                                <span>{total.toLocaleString()} EGP</span>
                            </div>
                            <div className={styles.summaryRow}>
                                <span>Delivery</span>
                                <span>{DELIVERY_FEE} EGP</span>
                            </div>
                            <div className={`${styles.summaryRow} ${styles.total}`}>
                                <span>Total</span>
                                <span>{finalTotal.toLocaleString()} EGP</span>
                            </div>
                            <button type="submit" disabled={loading} className="premium-button" style={{ width: '100%', opacity: loading ? 0.7 : 1 }}>
                                {loading ? <Loader2 className={styles.spinner} /> : 'Confirm Order'}
                            </button>
                            <div className={styles.security}>
                                <ShieldCheck size={16} />
                                <span>Secure SSL Encrypted Checkout</span>
                            </div>
                        </div>
                    </aside>
                </form>
            </div>
        </div>
    );
}
