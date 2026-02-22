"use client";

import React, { useState, useEffect, useMemo } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import styles from './Dashboard.module.css';
import { TrendingUp, Users, ShoppingBag, DollarSign, Loader2, XCircle, CornerDownLeft } from 'lucide-react';
import { supabase } from '@/lib/supabase';
import {
    Chart as ChartJS, CategoryScale, LinearScale, PointElement,
    LineElement, BarElement, Title, Tooltip, Legend, Filler
} from 'chart.js';
import { Line, Bar } from 'react-chartjs-2';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, BarElement, Title, Tooltip, Legend, Filler);

type TimeRange = 'week' | 'month' | 'year';

export default function AdminDashboard() {
    const [orders, setOrders] = useState<any[]>([]);
    const [productsCount, setProductsCount] = useState(0);
    const [loading, setLoading] = useState(true);
    const [timeRange, setTimeRange] = useState<TimeRange>('month');

    useEffect(() => {
        const fetchInitialData = async () => {
            setLoading(true);
            const [{ data: orderData }, { count }] = await Promise.all([
                supabase.from('orders').select('*').order('created_at', { ascending: true }),
                supabase.from('products').select('*', { count: 'exact', head: true })
            ]);
            if (orderData) setOrders(orderData);
            if (count) setProductsCount(count);
            setLoading(false);
        };
        fetchInitialData();
    }, []);

    const { filteredOrders, revenue, aov, chartData, cityData, cancelledOrders, returnedOrders } = useMemo(() => {
        const now = new Date();
        const startDate = new Date();
        if (timeRange === 'week') startDate.setDate(now.getDate() - 7);
        if (timeRange === 'month') startDate.setMonth(now.getMonth() - 1);
        if (timeRange === 'year') startDate.setFullYear(now.getFullYear() - 1);

        // Include all orders in range, except pure abandoned or failed if tracking status
        // Assume 'pending', 'confirmed', 'shipped', 'delivered' are revenue-generating
        const validStatuses = ['pending', 'confirmed', 'shipped', 'delivered'];
        const activeOrders = orders.filter(o =>
            new Date(o.created_at) >= startDate &&
            new Date(o.created_at) <= now &&
            validStatuses.includes(o.status)
        );

        const rev = activeOrders.reduce((acc, o) => acc + Number(o.total_amount || 0), 0);
        const average = activeOrders.length > 0 ? (rev / activeOrders.length).toFixed(0) : '0';

        // Group for chart
        const groups: Record<string, number> = {};

        // Init groups
        if (timeRange === 'year') {
            for (let i = 11; i >= 0; i--) {
                const d = new Date(now.getFullYear(), now.getMonth() - i, 1);
                groups[d.toLocaleString('default', { month: 'short' })] = 0;
            }
        } else {
            const days = timeRange === 'week' ? 7 : 30;
            for (let i = days - 1; i >= 0; i--) {
                const d = new Date(now.getTime() - i * 24 * 60 * 60 * 1000);
                groups[d.toLocaleDateString('default', { month: 'short', day: 'numeric' })] = 0;
            }
        }

        activeOrders.forEach(o => {
            const d = new Date(o.created_at);
            const key = timeRange === 'year'
                ? d.toLocaleString('default', { month: 'short' })
                : d.toLocaleDateString('default', { month: 'short', day: 'numeric' });
            if (groups[key] !== undefined) {
                groups[key] += Number(o.total_amount || 0);
            }
        });

        const cData = {
            labels: Object.keys(groups),
            datasets: [{
                label: `Revenue (EGP)`,
                data: Object.values(groups),
                borderColor: '#8B5E3C',
                backgroundColor: 'rgba(139, 94, 60, 0.1)',
                fill: true,
                tension: 0.4
            }]
        };

        // City distribution
        const cities: Record<string, number> = {};
        activeOrders.forEach(o => {
            if (o.city) {
                cities[o.city] = (cities[o.city] || 0) + 1;
            }
        });
        const sortedCities = Object.entries(cities).sort((a, b) => b[1] - a[1]).slice(0, 5);

        const ctData = {
            labels: sortedCities.length ? sortedCities.map(c => c[0]) : ['No Data'],
            datasets: [{
                label: 'Orders by City',
                data: sortedCities.length ? sortedCities.map(c => c[1]) : [0],
                backgroundColor: '#C5A059',
                borderRadius: 4
            }]
        };

        const cancelledOrders = orders.filter(o =>
            new Date(o.created_at) >= startDate &&
            new Date(o.created_at) <= now &&
            o.status === 'cancelled'
        ).length;

        const returnedOrders = orders.filter(o =>
            new Date(o.created_at) >= startDate &&
            new Date(o.created_at) <= now &&
            o.status === 'returned'
        ).length;

        return { filteredOrders: activeOrders, revenue: rev, aov: average, chartData: cData, cityData: ctData, cancelledOrders, returnedOrders };
    }, [orders, timeRange]);

    return (
        <AdminLayout>
            <div className={styles.dashboard}>
                <header className={styles.header}>
                    <h1>Dashboard Overview</h1>
                    <p>Track your store&apos;s performance with real data.</p>
                </header>

                <div className={styles.toolbar}>
                    <div className={styles.rangeSelector}>
                        <button
                            className={`${styles.rangeBtn} ${timeRange === 'week' ? styles.active : ''}`}
                            onClick={() => setTimeRange('week')}
                        >7 Days</button>
                        <button
                            className={`${styles.rangeBtn} ${timeRange === 'month' ? styles.active : ''}`}
                            onClick={() => setTimeRange('month')}
                        >30 Days</button>
                        <button
                            className={`${styles.rangeBtn} ${timeRange === 'year' ? styles.active : ''}`}
                            onClick={() => setTimeRange('year')}
                        >12 Months</button>
                    </div>
                </div>

                {loading ? (
                    <div className={styles.loading}><Loader2 size={32} className={styles.spinner} /></div>
                ) : (
                    <>
                        <div className={styles.statsGrid}>
                            <div className={styles.statCard}>
                                <div className={styles.statIcon}><DollarSign /></div>
                                <div className={styles.statInfo}>
                                    <span className={styles.statValue}>{revenue.toLocaleString()} EGP</span>
                                    <span className={styles.statLabel}>Revenue</span>
                                </div>
                            </div>
                            <div className={styles.statCard}>
                                <div className={styles.statIcon}><ShoppingBag /></div>
                                <div className={styles.statInfo}>
                                    <span className={styles.statValue}>{filteredOrders.length}</span>
                                    <span className={styles.statLabel}>Orders</span>
                                </div>
                            </div>
                            <div className={styles.statCard}>
                                <div className={styles.statIcon}><TrendingUp /></div>
                                <div className={styles.statInfo}>
                                    <span className={styles.statValue}>{Number(aov).toLocaleString()} EGP</span>
                                    <span className={styles.statLabel}>Avg Order Value</span>
                                </div>
                            </div>
                            <div className={styles.statCard}>
                                <div className={styles.statIcon}><Users /></div>
                                <div className={styles.statInfo}>
                                    <span className={styles.statValue}>{productsCount}</span>
                                    <span className={styles.statLabel}>Total Products</span>
                                </div>
                            </div>
                            <div className={styles.statCard}>
                                <div className={styles.statIcon} style={{ color: '#c62828', background: '#ffebee' }}><XCircle /></div>
                                <div className={styles.statInfo}>
                                    <span className={styles.statValue}>{cancelledOrders}</span>
                                    <span className={styles.statLabel}>Cancelled</span>
                                </div>
                            </div>
                            <div className={styles.statCard}>
                                <div className={styles.statIcon} style={{ color: '#616161', background: '#f5f5f5' }}><CornerDownLeft /></div>
                                <div className={styles.statInfo}>
                                    <span className={styles.statValue}>{returnedOrders}</span>
                                    <span className={styles.statLabel}>Returned</span>
                                </div>
                            </div>
                        </div>

                        <div className={styles.chartsGrid}>
                            <div className={styles.chartCard}>
                                <h3>Revenue Over Time</h3>
                                <div className={styles.chartWrapper}>
                                    <Line
                                        data={chartData}
                                        options={{
                                            responsive: true,
                                            maintainAspectRatio: false,
                                            plugins: { legend: { display: false } },
                                            scales: { y: { beginAtZero: true } }
                                        }}
                                    />
                                </div>
                            </div>
                            <div className={styles.chartCard}>
                                <h3>Sales by City</h3>
                                <div className={styles.chartWrapper}>
                                    <Bar
                                        data={cityData}
                                        options={{
                                            responsive: true,
                                            maintainAspectRatio: false,
                                            plugins: { legend: { display: false } }
                                        }}
                                    />
                                </div>
                            </div>
                        </div>
                    </>
                )}
            </div>
        </AdminLayout>
    );
}
