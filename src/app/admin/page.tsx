"use client";

import React, { useState, useEffect } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import styles from './Dashboard.module.css';
import { TrendingUp, Users, ShoppingBag, DollarSign, Loader2 } from 'lucide-react';
import { supabase } from '@/lib/supabase';
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    BarElement,
    Title,
    Tooltip,
    Legend,
    Filler
} from 'chart.js';
import { Line, Bar } from 'react-chartjs-2';

ChartJS.register(
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    BarElement,
    Title,
    Tooltip,
    Legend,
    Filler
);

export default function AdminDashboard() {
    const [stats, setStats] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [salesData, setSalesData] = useState<any>(null);

    useEffect(() => {
        fetchStats();
    }, []);

    const fetchStats = async () => {
        setLoading(true);
        const { data: orders } = await supabase.from('orders').select('*');
        const { count: productsCount } = await supabase.from('products').select('*', { count: 'exact', head: true });

        if (orders) {
            const totalRevenue = orders.reduce((acc, curr) => acc + Number(curr.total_amount), 0);
            const todayOrders = orders.filter(o => new Date(o.created_at).toDateString() === new Date().toDateString()).length;

            setStats([
                { label: 'Total Revenue', value: `${totalRevenue.toLocaleString()} EGP`, icon: <DollarSign />, trend: '+12.5%' },
                { label: 'Today\'s Orders', value: todayOrders.toString(), icon: <ShoppingBag />, trend: '+4.2%' },
                { label: 'Total Products', value: productsCount?.toString() || '0', icon: <Users />, trend: '+8.1%' },
                { label: 'Conversion Rate', value: '3.2%', icon: <TrendingUp />, trend: '+0.5%' },
            ]);

            // Simple sales chart data
            setSalesData({
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'Weekly Sales (EGP)',
                    data: [4000, 3000, 2000, 5000, 4000, 6000, totalRevenue],
                    borderColor: '#53402D',
                    backgroundColor: 'rgba(83, 64, 45, 0.1)',
                    fill: true,
                    tension: 0.4
                }]
            });
        }
        setLoading(false);
    };

    const CITY_DATA = {
        labels: ['Cairo', 'Giza', 'Alexandria', 'Mansoura', 'Suez'],
        datasets: [{
            label: 'Orders by City',
            data: [45, 32, 18, 12, 10],
            backgroundColor: '#C5A059'
        }]
    };

    return (
        <AdminLayout>
            <div className={styles.dashboard}>
                <header className={styles.header}>
                    <h1>Dashboard Overview</h1>
                    <p>Welcome back, Admin. Here&apos;s what&apos;s happening today.</p>
                </header>

                {loading ? (
                    <div className={styles.loading}><Loader2 className={styles.spinner} /></div>
                ) : (
                    <>
                        <div className={styles.statsGrid}>
                            {stats.map((stat, i) => (
                                <div key={i} className={styles.statCard}>
                                    <div className={styles.statIcon}>{stat.icon}</div>
                                    <div className={styles.statInfo}>
                                        <span className={styles.statValue}>{stat.value}</span>
                                        <span className={styles.statLabel}>{stat.label}</span>
                                    </div>
                                    <span className={styles.statTrend}>{stat.trend}</span>
                                </div>
                            ))}
                        </div>

                        <div className={styles.chartsGrid}>
                            <div className={styles.chartCard}>
                                <h3>Sales Performance</h3>
                                {salesData && <Line data={salesData} />}
                            </div>
                            <div className={styles.chartCard}>
                                <h3>Orders by City</h3>
                                <Bar data={CITY_DATA} />
                            </div>
                        </div>
                    </>
                )}
            </div>
        </AdminLayout>
    );
}
