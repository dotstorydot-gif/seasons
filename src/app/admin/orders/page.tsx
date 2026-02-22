"use client";

import React, { useState, useEffect, useCallback } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import styles from './Orders.module.css';
import { Search, Download, Loader2, ChevronDown, Package, Truck, CheckCircle, XCircle, Clock, X, Bell, CornerDownLeft } from 'lucide-react';
import { supabase } from '@/lib/supabase';
import { supabaseAdmin } from '@/lib/supabaseAdmin';

const STATUS_OPTIONS = ['pending', 'confirmed', 'shipped', 'delivered', 'cancelled', 'returned'] as const;
type OrderStatus = typeof STATUS_OPTIONS[number];

const STATUS_ICONS: Record<OrderStatus, React.ReactNode> = {
    pending: <Clock size={14} />,
    confirmed: <Package size={14} />,
    shipped: <Truck size={14} />,
    delivered: <CheckCircle size={14} />,
    cancelled: <XCircle size={14} />,
    returned: <CornerDownLeft size={14} />,
};

export default function OrdersPage() {
    const [orders, setOrders] = useState<any[]>([]);
    const [activeFilter, setActiveFilter] = useState('all');
    const [search, setSearch] = useState('');
    const [loading, setLoading] = useState(true);
    const [selectedOrder, setSelectedOrder] = useState<any | null>(null);
    const [updatingId, setUpdatingId] = useState<string | null>(null);
    const [newOrderAlert, setNewOrderAlert] = useState<string | null>(null);

    const fetchOrders = useCallback(async () => {
        setLoading(true);
        let query = supabase.from('orders').select('*').order('created_at', { ascending: false });
        if (activeFilter !== 'all') query = query.eq('status', activeFilter);
        const { data } = await query;
        if (data) setOrders(data);
        setLoading(false);
    }, [activeFilter]);

    useEffect(() => {
        fetchOrders();

        // Real-time new order notifications
        const channel = supabase
            .channel('orders_realtime')
            .on('postgres_changes', { event: 'INSERT', schema: 'public', table: 'orders' }, (payload) => {
                setNewOrderAlert(`New order #${payload.new.order_number} from ${payload.new.full_name}!`);
                fetchOrders();
                setTimeout(() => setNewOrderAlert(null), 8000);
            })
            .on('postgres_changes', { event: 'UPDATE', schema: 'public', table: 'orders' }, () => {
                fetchOrders();
            })
            .subscribe();

        return () => { supabase.removeChannel(channel); };
    }, [fetchOrders]);

    const updateStatus = async (orderId: string, status: OrderStatus) => {
        setUpdatingId(orderId);
        const { error } = await supabaseAdmin.from('orders').update({ status }).eq('id', orderId);
        if (error) { alert('Error updating status: ' + error.message); setUpdatingId(null); return; }
        setUpdatingId(null);
        fetchOrders();
        if (selectedOrder?.id === orderId) setSelectedOrder((p: any) => ({ ...p, status }));
    };

    const exportCSV = () => {
        const rows = [['Order #', 'Customer', 'Phone', 'City', 'Area', 'Address', 'Total', 'Shipping', 'Status', 'Date']];
        orders.forEach(o => rows.push([
            o.order_number, o.full_name, o.phone, o.city, o.area, o.address,
            o.total_amount, '30 EGP', o.status, new Date(o.created_at).toLocaleDateString()
        ]));
        const csv = rows.map(r => r.join(',')).join('\n');
        const blob = new Blob([csv], { type: 'text/csv' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a'); a.href = url; a.download = 'orders.csv'; a.click();
    };

    const filtered = orders.filter(o =>
        o.order_number?.toLowerCase().includes(search.toLowerCase()) ||
        o.full_name?.toLowerCase().includes(search.toLowerCase()) ||
        o.phone?.includes(search)
    );

    const counts: Record<string, number> = { all: orders.length };
    STATUS_OPTIONS.forEach(s => { counts[s] = orders.filter(o => o.status === s).length; });

    return (
        <AdminLayout>
            <div className={styles.orders}>

                {/* New order notification banner */}
                {newOrderAlert && (
                    <div className={styles.alertBanner}>
                        <Bell size={18} /> {newOrderAlert}
                        <button onClick={() => setNewOrderAlert(null)}><X size={16} /></button>
                    </div>
                )}

                <header className={styles.header}>
                    <div>
                        <h1>Order Management</h1>
                        <p className={styles.subheader}>{filtered.length} orders</p>
                    </div>
                    <button className={styles.exportBtn} onClick={exportCSV}>
                        <Download size={16} /> Export CSV
                    </button>
                </header>

                <div className={styles.toolbar}>
                    <div className={styles.search}>
                        <Search size={16} />
                        <input
                            type="text"
                            placeholder="Search by order #, name, or phone..."
                            value={search}
                            onChange={e => setSearch(e.target.value)}
                        />
                    </div>
                    <div className={styles.filters}>
                        {['all', ...STATUS_OPTIONS].map(f => (
                            <button
                                key={f}
                                className={`${styles.filterBtn} ${activeFilter === f ? styles.activeFilter : ''}`}
                                onClick={() => setActiveFilter(f)}
                            >
                                {f.charAt(0).toUpperCase() + f.slice(1)}
                                <span className={styles.filterCount}>{counts[f] ?? 0}</span>
                            </button>
                        ))}
                    </div>
                </div>

                <div className={styles.tableWrapper}>
                    {loading ? (
                        <div className={styles.loading}><Loader2 className={styles.spinner} /> Loading orders...</div>
                    ) : filtered.length === 0 ? (
                        <div className={styles.empty}>No orders found.</div>
                    ) : (
                        <table className={styles.table}>
                            <thead>
                                <tr>
                                    <th>Order #</th>
                                    <th>Customer</th>
                                    <th>Phone</th>
                                    <th>City / Area</th>
                                    <th>Items</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                {filtered.map(order => (
                                    <tr key={order.id} className={styles.row} onClick={() => setSelectedOrder(order)}>
                                        <td><strong>#{order.order_number}</strong></td>
                                        <td>{order.full_name}</td>
                                        <td>{order.phone}</td>
                                        <td>{order.city}, {order.area}</td>
                                        <td>{Array.isArray(order.items) ? order.items.length : '—'} items</td>
                                        <td><strong>{order.total_amount} EGP</strong></td>
                                        <td onClick={e => e.stopPropagation()}>
                                            <div className={`${styles.statusBadge} ${styles[order.status]}`}>
                                                {STATUS_ICONS[order.status as OrderStatus]}
                                                {updatingId === order.id ? (
                                                    <Loader2 size={12} className={styles.spin} />
                                                ) : (
                                                    <select
                                                        value={order.status}
                                                        onChange={e => updateStatus(order.id, e.target.value as OrderStatus)}
                                                        className={styles.statusSelect}
                                                    >
                                                        {STATUS_OPTIONS.map(s => (
                                                            <option key={s} value={s}>{s.charAt(0).toUpperCase() + s.slice(1)}</option>
                                                        ))}
                                                    </select>
                                                )}
                                                <ChevronDown size={12} />
                                            </div>
                                        </td>
                                        <td>{new Date(order.created_at).toLocaleDateString()}</td>
                                        <td onClick={e => e.stopPropagation()}>
                                            <button className={styles.detailBtn} onClick={() => setSelectedOrder(order)}>View</button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </div>

                {/* Order Detail Modal */}
                {selectedOrder && (
                    <div className={styles.modalOverlay} onClick={() => setSelectedOrder(null)}>
                        <div className={styles.modal} onClick={e => e.stopPropagation()}>
                            <button className={styles.modalClose} onClick={() => setSelectedOrder(null)}><X size={20} /></button>
                            <h2>Order #{selectedOrder.order_number}</h2>
                            <p className={styles.modalDate}>{new Date(selectedOrder.created_at).toLocaleString()}</p>

                            <div className={styles.modalGrid}>
                                <div className={styles.modalSection}>
                                    <h3>Customer Info</h3>
                                    <p><strong>Name:</strong> {selectedOrder.full_name}</p>
                                    <p><strong>Phone:</strong> {selectedOrder.phone}</p>
                                    {selectedOrder.alt_phone && <p><strong>Alt Phone:</strong> {selectedOrder.alt_phone}</p>}
                                    <p><strong>City:</strong> {selectedOrder.city}</p>
                                    <p><strong>Area:</strong> {selectedOrder.area}</p>
                                    <p><strong>Address:</strong> {selectedOrder.address}</p>
                                    {selectedOrder.delivery_notes && <p><strong>Notes:</strong> {selectedOrder.delivery_notes}</p>}
                                </div>
                                <div className={styles.modalSection}>
                                    <h3>Order Items</h3>
                                    {Array.isArray(selectedOrder.items) ? selectedOrder.items.map((item: any, i: number) => (
                                        <div key={i} className={styles.modalItem}>
                                            <span>{item.nameEn || item.name_en} × {item.quantity}</span>
                                            <span>{(item.price * item.quantity).toLocaleString()} EGP</span>
                                        </div>
                                    )) : <p>—</p>}
                                    <div className={styles.modalItem} style={{ marginTop: 8 }}>
                                        <span>Shipping</span><span>30 EGP</span>
                                    </div>
                                    <div className={`${styles.modalItem} ${styles.modalTotal}`}>
                                        <strong>Total</strong><strong>{selectedOrder.total_amount} EGP</strong>
                                    </div>
                                </div>
                            </div>

                            <div className={styles.modalStatus}>
                                <h3>Update Status</h3>
                                <div className={styles.statusButtons}>
                                    {STATUS_OPTIONS.map(s => (
                                        <button
                                            key={s}
                                            className={`${styles.statusBtn} ${selectedOrder.status === s ? styles.statusBtnActive : ''}`}
                                            onClick={() => updateStatus(selectedOrder.id, s)}
                                        >
                                            {STATUS_ICONS[s]} {s.charAt(0).toUpperCase() + s.slice(1)}
                                        </button>
                                    ))}
                                </div>
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </AdminLayout>
    );
}
