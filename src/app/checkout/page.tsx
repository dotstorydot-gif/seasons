"use client";

import React, { useState } from 'react';
import styles from './Checkout.module.css';
import { useRouter } from 'next/navigation';
import Image from 'next/image';
import { ShieldCheck, Loader2, Tag, X, Check } from 'lucide-react';
import { useCart } from '@/context/CartContext';
type CouponResult = {
    id: string;
    code: string;
    discount_type: 'percentage' | 'free_delivery';
    discount_value: number;
    used_count: number;
};

export default function CheckoutPage() {
    const router = useRouter();
    const { items, total, clearCart } = useCart();
    const [loading, setLoading] = useState(false);
    const [formData, setFormData] = useState({
        fullName: '', email: '', phone: '', altPhone: '', city: '', area: '', address: '', notes: ''
    });
    const [saveInfo, setSaveInfo] = useState(false);
    const [storeShippingFee, setStoreShippingFee] = useState<number>(75);
    const [freeShippingThreshold, setFreeShippingThreshold] = useState<number>(0);

    // Initial load for saved info & dynamic store settings
    React.useEffect(() => {
        const saved = localStorage.getItem('seasons-checkout-info');
        if (saved) {
            try {
                const parsed = JSON.parse(saved);
                setFormData(prev => ({ ...prev, ...parsed }));
                setSaveInfo(true);
            } catch (e) {
                console.error('Failed to load saved info:', e);
            }
        }

        // Also pre-fill the notes if the user entered one in the cart
        const cartNote = localStorage.getItem('seasons-order-note');
        if (cartNote) {
            setFormData(prev => ({ ...prev, notes: cartNote }));
        }

        // Load dynamic shipping settings from server
        const loadSettings = async () => {
            try {
                const res = await fetch('/api/settings');
                if (res.ok) {
                    const data = await res.json();
                    if (typeof data.shipping_fee === 'number') setStoreShippingFee(data.shipping_fee);
                    if (typeof data.free_shipping_threshold === 'number') setFreeShippingThreshold(data.free_shipping_threshold);
                }
            } catch {
                // Fallback to default
            }
        };
        loadSettings();
    }, []);

    // Coupon state
    const [couponCode, setCouponCode] = useState('');
    const [couponLoading, setCouponLoading] = useState(false);
    const [appliedCoupon, setAppliedCoupon] = useState<CouponResult | null>(null);
    const [couponError, setCouponError] = useState('');

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    // Calculate dynamic shipping fee
    const isFreeByThreshold = freeShippingThreshold > 0 && total >= freeShippingThreshold;
    const isFreeByCoupon = appliedCoupon?.discount_type === 'free_delivery';
    const effectiveShippingFee = isFreeByCoupon || isFreeByThreshold ? 0 : storeShippingFee;

    const discount = appliedCoupon
        ? appliedCoupon.discount_type === 'percentage'
            ? Math.round(total * appliedCoupon.discount_value / 100)
            : storeShippingFee
        : 0;

    const shipping = effectiveShippingFee;
    const finalTotal = Math.max(0, total - (appliedCoupon?.discount_type === 'percentage' ? discount : 0) + shipping);

    const applyCoupon = async () => {
        if (!couponCode.trim()) return;
        setCouponLoading(true);
        setCouponError('');
        setAppliedCoupon(null);

        const code = couponCode.trim().toUpperCase();

        // Validate coupon server-side (preview only — actual validation happens at checkout)
        const res = await fetch('/api/checkout', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                formData: {
                    fullName: formData.fullName || 'preview',
                    phone: formData.phone || '0000000000',
                    city: formData.city || 'preview',
                    area: formData.area || 'preview',
                    address: formData.address || 'preview',
                },
                items: items.map(i => ({ id: i.id, quantity: i.quantity })),
                couponCode: code,
                previewOnly: true,
            }),
        });
        const json = await res.json();

        if (!res.ok) {
            setCouponError(json.error || 'Invalid coupon code.');
            setCouponLoading(false);
            return;
        }

        // Simulate appliedCoupon object for UI display
        setAppliedCoupon({
            id: 'preview',
            code,
            discount_type: json.discountType || 'percentage',
            discount_value: json.discountType === 'percentage' ? json.discount : 0,
            used_count: 0,
        });
        setCouponLoading(false);
    };

    const removeCoupon = () => {
        setAppliedCoupon(null);
        setCouponCode('');
        setCouponError('');
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (items.length === 0) { alert('Your cart is empty'); return; }

        setLoading(true);

        const res = await fetch('/api/checkout', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                formData: {
                    fullName: formData.fullName,
                    email: formData.email,
                    phone: formData.phone,
                    altPhone: formData.altPhone,
                    city: formData.city,
                    area: formData.area,
                    address: formData.address,
                    notes: formData.notes,
                },
                items: items.map(i => ({ id: i.id, quantity: i.quantity })),
                couponCode: appliedCoupon?.code || '',
            }),
        });

        const json = await res.json();

        if (!res.ok) {
            alert(json.error || 'Error placing order. Please try again.');
            setLoading(false);
            return;
        }

        const orderNumber = json.orderNumber;

        // Save info for next time if checked
        if (saveInfo) {
            localStorage.setItem('seasons-checkout-info', JSON.stringify({
                fullName: formData.fullName,
                email: formData.email,
                phone: formData.phone,
                altPhone: formData.altPhone,
                city: formData.city,
                area: formData.area,
                address: formData.address
            }));
        } else {
            localStorage.removeItem('seasons-checkout-info');
        }

        clearCart();
        localStorage.removeItem('seasons-order-note');
        router.push(`/checkout/thank-you?order=${orderNumber}`);
    };

    return (
        <div className={styles.checkoutPage}>
            <div className={styles.container}>
                <h1 className={styles.title}>Secure Checkout</h1>

                <form onSubmit={handleSubmit} className={styles.layout}>
                    <div className={styles.main}>
                        <section className={styles.section}>
                            <div className={styles.contactBlock}>
                                <h2>Contact</h2>
                                <div className={styles.formGrid}>
                                    <div className={`${styles.field} ${styles.full}`}>
                                        <input type="email" name="email" required value={formData.email} onChange={handleChange} placeholder="Email or mobile phone number" />
                                    </div>
                                    <div className={`${styles.field} ${styles.full}`}>
                                        <label style={{ display: 'flex', alignItems: 'center', gap: '8px', textTransform: 'none', fontWeight: 'normal', color: 'var(--text-primary)', cursor: 'pointer', fontSize: '0.9rem' }}>
                                            <input type="checkbox" checked={saveInfo} onChange={(e) => setSaveInfo(e.target.checked)} style={{ width: '16px', height: '16px', margin: 0, padding: 0 }} />
                                            Email me with news and offers
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div className={styles.deliveryBlock} style={{ marginTop: '40px' }}>
                                <h2>Delivery</h2>
                                <div className={styles.formGrid}>
                                    <div className={`${styles.field} ${styles.full}`}>
                                        <select disabled style={{ backgroundColor: '#f5f5f5', color: '#666' }}>
                                            <option>Egypt</option>
                                        </select>
                                    </div>
                                    <div className={styles.field}>
                                        <input type="text" name="fullName" required value={formData.fullName} onChange={handleChange} placeholder="First and last name" />
                                    </div>
                                    <div className={styles.field}>
                                        <input type="tel" name="phone" required value={formData.phone} onChange={handleChange} placeholder="Phone (e.g. 01234567890)" />
                                    </div>
                                    <div className={`${styles.field} ${styles.full}`}>
                                        <textarea name="address" required value={formData.address} onChange={handleChange} placeholder="Address (Building, Apartment, Street)" rows={2} />
                                    </div>
                                    <div className={styles.field}>
                                        <select name="city" required value={formData.city} onChange={handleChange}>
                                            <option value="">Governorate</option>
                                            <option value="Cairo">Cairo</option>
                                            <option value="Giza">Giza</option>
                                            <option value="Alexandria">Alexandria</option>
                                            <option value="Hurghada">Hurghada</option>
                                            <option value="Luxor">Luxor</option>
                                        </select>
                                    </div>
                                    <div className={styles.field}>
                                        <input type="text" name="area" required value={formData.area} onChange={handleChange} placeholder="City / Area" />
                                    </div>
                                    <div className={`${styles.field} ${styles.full}`}>
                                        <textarea name="notes" value={formData.notes} onChange={handleChange} placeholder="Special instructions / delivery notes (optional)" rows={1} />
                                    </div>

                                    <div className={`${styles.field} ${styles.full}`} style={{ marginTop: '8px' }}>
                                        <label style={{ display: 'flex', alignItems: 'center', gap: '8px', textTransform: 'none', fontWeight: 'normal', color: 'var(--text-primary)', cursor: 'pointer', fontSize: '0.9rem' }}>
                                            <input type="checkbox" checked={saveInfo} onChange={(e) => setSaveInfo(e.target.checked)} style={{ width: '16px', height: '16px', margin: 0, padding: 0 }} />
                                            Save this information for next time
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <section className={styles.section}>
                            <h2>Shipping method</h2>
                            <div className={styles.paymentMethod} style={{ justifyContent: 'space-between', alignItems: 'center' }}>
                                <span>Standard Shipping</span>
                                <strong>{shipping === 0 ? 'Free' : `${shipping} EGP`}</strong>
                            </div>
                        </section>

                        <section className={styles.section}>
                            <h2>Payment</h2>
                            <span style={{ fontSize: '0.85rem', color: 'var(--text-muted)', display: 'block', marginBottom: '16px' }}>All transactions are secure and encrypted.</span>
                            <div className={styles.paymentMethod}>
                                <input type="radio" checked readOnly style={{ accentColor: '#A05A2C' }} />
                                <div className={styles.paymentLabel}>
                                    <strong>Cash on Delivery (COD)</strong>
                                    <span>Pay with cash upon delivery.</span>
                                </div>
                            </div>
                        </section>
                    </div>

                    <aside className={styles.sidebar}>
                        <div className={styles.orderSummary}>
                            <h2>Your Order</h2>

                            {/* Cart items preview */}
                            <div className={styles.itemsPreview}>
                                {items.map(item => (
                                    <div key={item.id} className={styles.previewItem}>
                                        <div className={styles.previewImageContainer}>
                                            <div className={styles.quantityBadge}>{item.quantity}</div>
                                            {item.image ? (
                                                <Image
                                                    src={item.image}
                                                    alt={item.nameEn}
                                                    width={64}
                                                    height={64}
                                                    style={{ objectFit: 'cover', borderRadius: '8px' }}
                                                />
                                            ) : (
                                                <div style={{ width: '100%', height: '100%', background: '#E5E1DA', borderRadius: '8px' }} />
                                            )}
                                        </div>
                                        <div className={styles.previewInfo}>
                                            <h4>{item.nameEn}</h4>
                                        </div>
                                        <div className={styles.previewPrice}>
                                            {(item.price * item.quantity).toLocaleString()} EGP
                                        </div>
                                    </div>
                                ))}
                            </div>

                            {/* Coupon section */}
                            <div className={styles.couponSection}>
                                <label className={styles.couponLabel}>
                                    <Tag size={14} /> Have a coupon?
                                </label>
                                {appliedCoupon ? (
                                    <div className={styles.couponApplied}>
                                        <Check size={15} />
                                        <span>
                                            <strong>{appliedCoupon.code}</strong> —{' '}
                                            {appliedCoupon.discount_type === 'free_delivery'
                                                ? 'Free delivery applied!'
                                                : `${appliedCoupon.discount_value}% off applied!`}
                                        </span>
                                        <button type="button" onClick={removeCoupon} className={styles.removeCoupon}><X size={13} /></button>
                                    </div>
                                ) : (
                                    <div className={styles.couponInput}>
                                        <input
                                            type="text"
                                            placeholder="ENTER CODE"
                                            value={couponCode}
                                            onChange={e => setCouponCode(e.target.value.toUpperCase())}
                                            onKeyDown={e => e.key === 'Enter' && (e.preventDefault(), applyCoupon())}
                                        />
                                        <button type="button" onClick={applyCoupon} disabled={couponLoading} className={styles.applyBtn}>
                                            {couponLoading ? <Loader2 size={14} className={styles.spin} /> : 'Apply'}
                                        </button>
                                    </div>
                                )}
                                {couponError && <p className={styles.couponError}>{couponError}</p>}
                            </div>

                            {/* Totals */}
                            <div className={styles.summaryRow}>
                                <span>Subtotal</span>
                                <span>{total.toLocaleString()} EGP</span>
                            </div>
                            {appliedCoupon?.discount_type === 'percentage' && (
                                <div className={`${styles.summaryRow} ${styles.discount}`}>
                                    <span>Discount ({appliedCoupon.discount_value}%)</span>
                                    <span>−{discount.toLocaleString()} EGP</span>
                                </div>
                            )}
                            <div className={styles.summaryRow}>
                                <span>Shipping</span>
                                <span className={shipping === 0 ? styles.free : ''}>
                                    {shipping === 0 ? 'FREE' : `${shipping} EGP`}
                                </span>
                            </div>
                            <div className={`${styles.summaryRow} ${styles.total}`}>
                                <span>Total</span>
                                <span>{finalTotal.toLocaleString()} EGP</span>
                            </div>

                            <button type="submit" disabled={loading || items.length === 0} className="premium-button" style={{ width: '100%', opacity: loading ? 0.7 : 1 }}>
                                {loading ? <Loader2 className={styles.spinner} /> : 'Confirm Order'}
                            </button>
                            <div className={styles.security}>
                                <ShieldCheck size={16} />
                                <span>SSL Encrypted · Secure Checkout</span>
                            </div>
                        </div>
                    </aside>
                </form>
            </div>
        </div>
    );
}
