"use client";

import React, { useState, useEffect } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import styles from './Orders.module.css';
import { Search, Eye, Download, Loader2 } from 'lucide-react';
import { supabase } from '@/lib/supabase';

export default function OrdersPage() {
    const [orders, setOrders] = useState<any[]>([]);
    const [activeFilter, setActiveFilter] = useState('All');
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchOrders();

        // Real-time subscription
        const channel = supabase
            .channel('orders_updates')
            .on('postgres_changes', { event: '*', schema: 'public', table: 'orders' }, () => {
                fetchOrders();
            })
            .subscribe();

        return () => {
            supabase.removeChannel(channel);
        };
    }, [activeFilter]);

    const fetchOrders = async () => {
        setLoading(true);
        let query = supabase.from('orders').select('*').order('created_at', { ascending: false });

        if (activeFilter !== 'All') {
            query = query.eq('status', activeFilter.toLowerCase());
        }

        const { data } = await query;
        if (data) setOrders(data);
        setLoading(false);
    };

    return (
        <AdminLayout>
            <div className={styles.orders}>
                <header className={styles.header}>
                    <h1>Order Management</h1>
                    <div className={styles.actions}>
                        <button className={styles.exportBtn}><Download size={18} /> Export CSV</button>
                    </div>
                </header>

                <div className={styles.toolbar}>
                    <div className={styles.search}>
                        <Search size={18} />
                        <input type="text" placeholder="Search orders by ID or customer..." />
                    </div>
                    <div className={styles.filters}>
                        {['All', 'Pending', 'Shipped', 'Completed', 'Cancelled'].map(f => (
                            <button
                                key={f}
                                className={`${styles.filterBtn} ${activeFilter === f ? styles.active : ''}`}
                                onClick={() => setActiveFilter(f)}
                            >
                                {f}
                            </button>
                        ))}
                    </div>
                </div>

                <div className={styles.tableWrapper}>
                    {loading ? (
                        <div className={styles.loading}><Loader2 className={styles.spinner} /></div>
                    ) : (
                        <table className={styles.table}>
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer Name</th>
                                    <th>City</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                {orders.map(order => (
                                    <tr key={order.id}>
                                        <td><strong>#{order.order_number}</strong></td>
                                        <td>{order.full_name}</td>
                                        <td>{order.city}</td>
                                        <td>{order.total_amount} EGP</td>
                                        <td>
                                            <span className={`${styles.status} ${styles[order.status.toLowerCase()]}`}>
                                                {order.status}
                                            </span>
                                        </td>
                                        <td>{new Date(order.created_at).toLocaleDateString()}</td>
                                        <td>
                                            <button className={styles.iconBtn}><Eye size={16} /></button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </div>
            </div>
        </AdminLayout>
    );
}
