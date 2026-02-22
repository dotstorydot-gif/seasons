"use client";

import React, { useState, useEffect, useMemo } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import { supabase } from '@/lib/supabase';
import {
    Chart as ChartJS, CategoryScale, LinearScale, PointElement,
    LineElement, BarElement, Title, Tooltip, Legend, Filler
} from 'chart.js';
import { Line, Bar } from 'react-chartjs-2';
import styles from '../Dashboard.module.css'; // Reuse dashboard styles for cards and charts
import { Loader2, TrendingUp, DollarSign, ShoppingBag, Globe } from 'lucide-react';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, BarElement, Title, Tooltip, Legend, Filler);

interface AdminOrder {
    id: string;
    created_at: string;
    total_amount: number;
    status: 'pending' | 'confirmed' | 'shipped' | 'delivered' | 'cancelled' | 'returned';
    city?: string;
}

type TimeRange = 'week' | 'month' | 'year';

export default function AnalyticsPage() {
    const [orders, setOrders] = useState<AdminOrder[]>([]);
    const [loading, setLoading] = useState(true);
    const [timeRange, setTimeRange] = useState<TimeRange>('month');

    useEffect(() => {
        const fetchOrders = async () => {
            setLoading(true);
            const { data } = await supabase.from('orders').select('*').order('created_at', { ascending: true });
            if (data) setOrders(data);
            setLoading(false);
        };
        fetchOrders();
    }, []);

    const { chartData, cityData, revenue, totalOrders, aov } = useMemo(() => {
        const now = new Date();
        const startDate = new Date();
        if (timeRange === 'week') startDate.setDate(now.getDate() - 7);
        if (timeRange === 'month') startDate.setMonth(now.getMonth() - 1);
        if (timeRange === 'year') startDate.setFullYear(now.getFullYear() - 1);

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
            if (groups[key] !== undefined) groups[key] += Number(o.total_amount || 0);
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

        const cities: Record<string, number> = {};
        activeOrders.forEach(o => {
            if (o.city) cities[o.city] = (cities[o.city] || 0) + 1;
        });

        const sortedCities = Object.entries(cities)
            .sort((a, b) => b[1] - a[1])
            .slice(0, 5);

        const citData = {
            labels: sortedCities.map(c => c[0]),
            datasets: [{
                label: 'Orders',
                data: sortedCities.map(c => c[1]),
                backgroundColor: '#B8945A',
                borderRadius: 4
            }]
        };

        return { chartData: cData, cityData: citData, revenue: rev, totalOrders: activeOrders.length, aov: average };
    }, [orders, timeRange]);

    if (loading) return (
        <AdminLayout>
            <div className={styles.loading}><Loader2 className={styles.spinner} size={40} /></div>
        </AdminLayout>
    );

    return (
        <AdminLayout>
            <div className={styles.dashboard} style={{ padding: '40px' }}>
                <header className={styles.header}>
                    <div>
                        <h1>Analytics Overview</h1>
                        <p>Track your store&apos;s performance and growth</p>
                    </div>
                </header>

                <div className={styles.toolbar}>
                    <div className={styles.rangeSelector}>
                        {(['week', 'month', 'year'] as TimeRange[]).map(r => (
                            <button
                                key={r}
                                className={`${styles.rangeBtn} ${timeRange === r ? styles.active : ''}`}
                                onClick={() => setTimeRange(r)}
                            >
                                {r.charAt(0).toUpperCase() + r.slice(1)}
                            </button>
                        ))}
                    </div>
                </div>

                <div className={styles.statsGrid}>
                    <div className={styles.statCard}>
                        <div className={styles.statIcon}><DollarSign /></div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{revenue.toLocaleString()} EGP</span>
                            <span className={styles.statLabel}>Total Revenue</span>
                        </div>
                    </div>
                    <div className={styles.statCard}>
                        <div className={styles.statIcon}><ShoppingBag /></div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{totalOrders}</span>
                            <span className={styles.statLabel}>Total Orders</span>
                        </div>
                    </div>
                    <div className={styles.statCard}>
                        <div className={styles.statIcon}><TrendingUp /></div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{Number(aov).toLocaleString()} EGP</span>
                            <span className={styles.statLabel}>Avg. Order Value</span>
                        </div>
                    </div>
                    <div className={styles.statCard}>
                        <div className={styles.statIcon}><Globe /></div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{Object.keys(cityData.labels).length}</span>
                            <span className={styles.statLabel}>Active Cities</span>
                        </div>
                    </div>
                </div>

                <div className={styles.chartsGrid}>
                    <div className={styles.chartCard}>
                        <h3>Revenue Growth</h3>
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
                    <div className={styles.chartCard} style={{ maxHeight: '420px', overflowY: 'auto' }}>
                        <h3>Top Cities</h3>
                        <div className={styles.chartWrapper} style={{ height: '300px' }}>
                            <Bar
                                data={cityData}
                                options={{
                                    responsive: true,
                                    maintainAspectRatio: false,
                                    indexAxis: 'y',
                                    plugins: { legend: { display: false } }
                                }}
                            />
                        </div>
                    </div>
                </div>
            </div>
        </AdminLayout>
    );
}
