"use client";

import React, { useState } from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './TrackOrder.module.css';
import { Search, Package, MapPin, Calendar, CheckCircle2, XCircle, RotateCcw, Truck, CornerDownLeft } from 'lucide-react';
import { supabase } from '@/lib/supabase';

type OrderItem = { id: string; nameEn: string; price: number; quantity: number };

type Order = {
    id: string;
    order_number: string;
    status: string;
    total_amount: number;
    created_at: string;
    city: string;
    address: string;
    items: OrderItem[];
};

export default function TrackOrderPage() {
    const { language, dir } = useLanguage();
    const [orderNumber, setOrderNumber] = useState('');
    const [phone, setPhone] = useState('');
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');
    const [order, setOrder] = useState<Order | null>(null);

    const handleSearch = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!orderNumber.trim() || !phone.trim()) return;

        setLoading(true);
        setError('');
        setOrder(null);

        const formattedOrderNumber = orderNumber.trim().toUpperCase();

        const { data, error: fetchError } = await supabase
            .from('orders')
            .select('*')
            .eq('order_number', formattedOrderNumber)
            .eq('phone', phone.trim())
            .single();

        if (fetchError || !data) {
            setError(language === 'en' ? "We couldn't find an order with that number and phone combination." : "لم نتمكن من العثور على طلب بهذا الرقم مع هذا الهاتف.");
            setLoading(false);
            return;
        }

        setOrder(data as Order);
        setLoading(false);
    };

    const handleCancelOrder = async () => {
        if (!order || order.status !== 'pending') return;

        const confirmMsg = language === 'en' ? 'Are you sure you want to cancel this order? This action cannot be undone.' : 'هل أنت متأكد أنك تريد إلغاء هذا الطلب؟ لا يمكن التراجع عن هذا الإجراء.';
        if (!confirm(confirmMsg)) return;

        setLoading(true);
        const { error: updateError } = await supabase
            .from('orders')
            .update({ status: 'cancelled' })
            .eq('id', order.id);

        if (updateError) {
            alert(language === 'en' ? 'Failed to cancel the order. Please try again or contact support.' : 'فشل إلغاء الطلب. يرجى المحاولة مرة أخرى أو الاتصال بالدعم.');
            setLoading(false);
            return;
        }

        setOrder({ ...order, status: 'cancelled' });
        setLoading(false);
        alert(language === 'en' ? 'Your order has been cancelled successfully.' : 'تم إلغاء طلبك بنجاح.');
    };

    const getStatusConfig = (status: string) => {
        switch (status) {
            case 'pending': return { icon: <Calendar strokeWidth={1.5} />, color: '#EF6C00', bg: '#FFF3E0', text: language === 'en' ? 'Processing' : 'قيد المعالجة' };
            case 'confirmed': return { icon: <CheckCircle2 strokeWidth={1.5} />, color: '#4527A0', bg: '#EDE7F6', text: language === 'en' ? 'Confirmed' : 'مؤكد' };
            case 'shipped': return { icon: <Truck strokeWidth={1.5} />, color: '#1565C0', bg: '#E3F2FD', text: language === 'en' ? 'Shipped' : 'تم الشحن' };
            case 'delivered': return { icon: <Package strokeWidth={1.5} />, color: '#2E7D32', bg: '#E8F5E9', text: language === 'en' ? 'Delivered' : 'تم التوصيل' };
            case 'cancelled': return { icon: <XCircle strokeWidth={1.5} />, color: '#C62828', bg: '#FFEBEE', text: language === 'en' ? 'Cancelled' : 'ملغى' };
            case 'returned': return { icon: <CornerDownLeft strokeWidth={1.5} />, color: '#616161', bg: '#F5F5F5', text: language === 'en' ? 'Returned' : 'مسترجع' };
            default: return { icon: <Package strokeWidth={1.5} />, color: '#666', bg: '#eee', text: status };
        }
    };

    return (
        <div className={styles.page}>
            <div className={styles.container} dir={dir}>
                <div className={styles.header}>
                    <h1>{language === 'en' ? 'Track Your Order' : 'تتبع طلبك'}</h1>
                    <p>{language === 'en' ? 'Enter your order number and phone number to see your order status.' : 'أدخل رقم طلبك ورقم هاتفك لمعرفة حالة طلبك.'}</p>
                </div>

                <form onSubmit={handleSearch} className={styles.formCard}>
                    <div className={styles.inputGroup}>
                        <label>{language === 'en' ? 'Order Number' : 'رقم الطلب'}</label>
                        <input
                            type="text"
                            placeholder={language === 'en' ? 'e.g. ORD-123456789' : 'مثال: ORD-123456789'}
                            value={orderNumber}
                            onChange={e => setOrderNumber(e.target.value)}
                            required
                            dir="ltr"
                        />
                    </div>
                    <div className={styles.inputGroup}>
                        <label>{language === 'en' ? 'Phone Number' : 'رقم الهاتف'}</label>
                        <input
                            type="tel"
                            placeholder={language === 'en' ? 'e.g. 01000000000' : 'مثال: 01000000000'}
                            value={phone}
                            onChange={e => setPhone(e.target.value)}
                            required
                            dir="ltr"
                        />
                    </div>
                    <button type="submit" className={styles.searchBtn} disabled={loading}>
                        {loading && !order ? <RotateCcw className={styles.spin} size={18} /> : <Search size={18} />}
                        {language === 'en' ? 'Find Order' : 'بحث عن الطلب'}
                    </button>
                    {error && <p className={styles.error}>{error}</p>}
                </form>

                {order && (
                    <div className={styles.orderCard}>
                        <div className={styles.orderHeader}>
                            <div>
                                <h2>{language === 'en' ? 'Order' : 'طلب'} {order.order_number}</h2>
                                <span className={styles.date}>{new Date(order.created_at).toLocaleDateString(language === 'en' ? 'en-US' : 'ar-EG', { year: 'numeric', month: 'long', day: 'numeric' })}</span>
                            </div>

                            {(() => {
                                const config = getStatusConfig(order.status);
                                return (
                                    <div className={styles.statusBadge} style={{ color: config.color, backgroundColor: config.bg }}>
                                        {config.icon}
                                        {config.text}
                                    </div>
                                );
                            })()}
                        </div>

                        <div className={styles.grid}>
                            <div className={styles.section}>
                                <h3>{language === 'en' ? 'Delivery Details' : 'تفاصيل التوصيل'}</h3>
                                <div className={styles.detailRow}>
                                    <MapPin size={16} />
                                    <span>{order.address}, {order.city}</span>
                                </div>
                            </div>
                            <div className={styles.section}>
                                <h3>{language === 'en' ? 'Order Summary' : 'ملخص الطلب'}</h3>
                                <div className={styles.itemsList}>
                                    {order.items.map((item, idx) => (
                                        <div key={idx} className={styles.item}>
                                            <span className={styles.itemName}>{item.quantity}x {language === 'en' ? item.nameEn : (item as any).nameAr || item.nameEn}</span>
                                            <span className={styles.itemPrice}>{(item.price * item.quantity).toLocaleString()} {language === 'en' ? 'EGP' : 'ج.م'}</span>
                                        </div>
                                    ))}
                                </div>
                                <div className={styles.totalRow}>
                                    <span>{language === 'en' ? 'Total' : 'المجموع'}</span>
                                    <span>{order.total_amount.toLocaleString()} {language === 'en' ? 'EGP' : 'ج.م'}</span>
                                </div>
                            </div>
                        </div>

                        {order.status === 'pending' && (
                            <div className={styles.cancelSection}>
                                <p>{language === 'en' ? 'You can cancel your order while it is still processing.' : 'يمكنك إلغاء طلبك طالما أنه لا يزال قيد المعالجة.'}</p>
                                <button onClick={handleCancelOrder} disabled={loading} className={styles.cancelBtn}>
                                    {loading ? (language === 'en' ? 'Cancelling...' : 'جاري الإلغاء...') : (language === 'en' ? 'Cancel Order' : 'إلغاء الطلب')}
                                </button>
                            </div>
                        )}

                        {(order.status === 'delivered') && (
                            <div className={styles.returnNotice}>
                                <p>{language === 'en' ? 'Delivered! To request a return, please contact support via WhatsApp within 48 hours of delivery.' : 'تم التوصيل! لطلب إرجاع، يرجى الاتصال بالدعم عبر واتساب في غضون 48 ساعة من الاستلام.'}</p>
                            </div>
                        )}
                    </div>
                )}
            </div>
        </div>
    );
}
