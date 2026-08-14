"use client";

import React, { useState, useEffect, useMemo, useCallback } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import { supabase } from '@/lib/supabase';
import { adminHeaders } from '@/lib/adminHeaders';
import {
    Chart as ChartJS, CategoryScale, LinearScale, PointElement,
    LineElement, BarElement, ArcElement, Title, Tooltip, Legend, Filler
} from 'chart.js';
import { Line, Bar, Doughnut } from 'react-chartjs-2';
import styles from '../Dashboard.module.css';
import { Loader2, TrendingUp, DollarSign, ShoppingBag, Eye, Users, RefreshCw, Activity } from 'lucide-react';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, BarElement, ArcElement, Title, Tooltip, Legend, Filler);

interface AdminOrder {
    id: string;
    created_at: string;
    total_amount: number;
    status: 'pending' | 'confirmed' | 'shipped' | 'delivered' | 'cancelled' | 'returned';
    city?: string;
}

interface ActiveVisitor {
    sessionId: string;
    path: string;
    deviceType: string;
    minutesAgo: number;
}

interface TrafficData {
    onlineNow: number;
    activeVisitors: ActiveVisitor[];
    todayViews: number;
    totalViews: number;
    uniqueSessions: number;
    topPages: Array<{ path: string; views: number }>;
    devices: { desktop: number; mobile: number; tablet: number };
    hourlyDistribution: Record<string, number>;
}

type TimeRange = 'week' | 'month' | 'year';

export default function AnalyticsPage() {
    const [orders, setOrders] = useState<AdminOrder[]>([]);
    const [traffic, setTraffic] = useState<TrafficData | null>(null);
    const [loading, setLoading] = useState(true);
    const [trafficLoading, setTrafficLoading] = useState(false);
    const [timeRange, setTimeRange] = useState<TimeRange>('month');

    // Fetch traffic analytics
    const fetchTraffic = useCallback(async () => {
        setTrafficLoading(true);
        try {
            const res = await fetch('/api/admin/traffic', {
                headers: adminHeaders(),
            });
            if (res.ok) {
                const data = await res.json();
                setTraffic(data);
            }
        } catch (err) {
            console.error('Error fetching traffic analytics:', err);
        } finally {
            setTrafficLoading(false);
        }
    }, []);

    // Fetch order analytics
    const fetchOrders = useCallback(async () => {
        const { data, error } = await supabase.from('orders').select('*').order('created_at', { ascending: true });
        if (error) {
            console.error('Error fetching orders for analytics:', error);
            return;
        }
        if (data) setOrders(data as AdminOrder[]);
    }, []);

    useEffect(() => {
        const load = async () => {
            setLoading(true);
            const results = await Promise.allSettled([fetchTraffic(), fetchOrders()]);
            results.forEach((res) => {
                if (res.status === 'rejected') {
                    console.error('Analytics fetch error:', res.reason);
                }
            });
            setLoading(false);
        };
        load();

        // Auto-refresh real-time traffic every 10 seconds
        const interval = setInterval(() => {
            fetchTraffic();
        }, 10000);

        return () => clearInterval(interval);
    }, [fetchTraffic, fetchOrders]);

    // Financial & Order metrics computation
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

    // Hourly traffic chart data
    const trafficHourlyChart = useMemo(() => {
        if (!traffic?.hourlyDistribution) return null;
        return {
            labels: Object.keys(traffic.hourlyDistribution),
            datasets: [{
                label: 'Page Views Today',
                data: Object.values(traffic.hourlyDistribution),
                borderColor: '#2563eb',
                backgroundColor: 'rgba(37, 99, 235, 0.12)',
                fill: true,
                tension: 0.35,
            }],
        };
    }, [traffic]);

    // Device breakdown chart data
    const deviceChartData = useMemo(() => {
        if (!traffic?.devices) return null;
        return {
            labels: ['Desktop', 'Mobile', 'Tablet'],
            datasets: [{
                data: [traffic.devices.desktop || 0, traffic.devices.mobile || 0, traffic.devices.tablet || 0],
                backgroundColor: ['#1e293b', '#3b82f6', '#10b981'],
                borderWidth: 0,
            }],
        };
    }, [traffic]);

    if (loading) return (
        <AdminLayout>
            <div className={styles.loading}><Loader2 className={styles.spinner} size={40} /></div>
        </AdminLayout>
    );

    return (
        <AdminLayout>
            <div className={styles.dashboard} style={{ padding: '40px' }}>
                {/* Header with Live Traffic Banner */}
                <header className={styles.header} style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                    <div>
                        <h1>Traffic & Store Analytics</h1>
                        <p>Monitor real-time visitors, user engagement, and store performance.</p>
                    </div>

                    {/* Live Online Badge */}
                    <div style={{
                        display: 'flex',
                        alignItems: 'center',
                        gap: '12px',
                        backgroundColor: '#10b98115',
                        border: '1px solid #10b98140',
                        padding: '10px 18px',
                        borderRadius: '30px',
                    }}>
                        <span style={{
                            width: '12px',
                            height: '12px',
                            borderRadius: '50%',
                            backgroundColor: '#10b981',
                            boxShadow: '0 0 10px #10b981',
                            animation: 'pulse 1.5s infinite',
                        }} />
                        <strong style={{ color: '#065f46', fontSize: '0.95rem' }}>
                            {traffic?.onlineNow ?? 0} Online User{(traffic?.onlineNow ?? 0) === 1 ? '' : 's'} Right Now
                        </strong>
                        <button
                            onClick={fetchTraffic}
                            style={{ background: 'none', border: 'none', cursor: 'pointer', display: 'flex', alignItems: 'center', color: '#059669' }}
                            title="Refresh traffic now"
                        >
                            <RefreshCw size={14} className={trafficLoading ? styles.spinner : ''} />
                        </button>
                    </div>
                </header>

                {/* Range Selector & Live Traffic Quick Stat Grid */}
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

                {/* Real-time Traffic Stat Cards */}
                <div className={styles.statsGrid} style={{ marginBottom: '30px' }}>
                    <div className={styles.statCard}>
                        <div className={styles.statIcon} style={{ backgroundColor: '#10b98120', color: '#10b981' }}>
                            <Activity />
                        </div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{traffic?.onlineNow ?? 0}</span>
                            <span className={styles.statLabel}>Live Active Visitors</span>
                        </div>
                    </div>

                    <div className={styles.statCard}>
                        <div className={styles.statIcon} style={{ backgroundColor: '#3b82f620', color: '#3b82f6' }}>
                            <Eye />
                        </div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{traffic?.todayViews?.toLocaleString() ?? 0}</span>
                            <span className={styles.statLabel}>Page Views Today</span>
                        </div>
                    </div>

                    <div className={styles.statCard}>
                        <div className={styles.statIcon} style={{ backgroundColor: '#8b5cf620', color: '#8b5cf6' }}>
                            <Users />
                        </div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{traffic?.uniqueSessions?.toLocaleString() ?? 0}</span>
                            <span className={styles.statLabel}>Unique Visitors</span>
                        </div>
                    </div>

                    <div className={styles.statCard}>
                        <div className={styles.statIcon} style={{ backgroundColor: '#f59e0b20', color: '#f59e0b' }}>
                            <DollarSign />
                        </div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{revenue.toLocaleString()} EGP</span>
                            <span className={styles.statLabel}>Total Revenue</span>
                        </div>
                    </div>

                    <div className={styles.statCard}>
                        <div className={styles.statIcon} style={{ backgroundColor: '#ec489920', color: '#ec4899' }}>
                            <ShoppingBag />
                        </div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{totalOrders}</span>
                            <span className={styles.statLabel}>Total Orders</span>
                        </div>
                    </div>

                    <div className={styles.statCard}>
                        <div className={styles.statIcon} style={{ backgroundColor: '#06b6d420', color: '#06b6d4' }}>
                            <TrendingUp />
                        </div>
                        <div className={styles.statInfo}>
                            <span className={styles.statValue}>{Number(aov).toLocaleString()} EGP</span>
                            <span className={styles.statLabel}>Avg. Order Value</span>
                        </div>
                    </div>
                </div>

                {/* Traffic Visualizations */}
                <div className={styles.chartsGrid} style={{ marginBottom: '30px' }}>
                    {/* Hourly Traffic Chart */}
                    <div className={styles.chartCard}>
                        <h3>Traffic Volume (Today &apos;s Page Views)</h3>
                        <div className={styles.chartWrapper}>
                            {trafficHourlyChart ? (
                                <Line
                                    data={trafficHourlyChart}
                                    options={{
                                        responsive: true,
                                        maintainAspectRatio: false,
                                        plugins: { legend: { display: false } },
                                        scales: { y: { beginAtZero: true } },
                                    }}
                                />
                            ) : (
                                <div className={styles.loading}>No traffic data yet</div>
                            )}
                        </div>
                    </div>

                    {/* Device Breakdown */}
                    <div className={styles.chartCard}>
                        <h3>Device Type Breakdown</h3>
                        <div className={styles.chartWrapper} style={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                            {deviceChartData ? (
                                <div style={{ height: '240px', width: '240px' }}>
                                    <Doughnut
                                        data={deviceChartData}
                                        options={{
                                            responsive: true,
                                            maintainAspectRatio: false,
                                            plugins: { legend: { position: 'bottom' } },
                                        }}
                                    />
                                </div>
                            ) : (
                                <div className={styles.loading}>No device data yet</div>
                            )}
                        </div>
                    </div>
                </div>

                {/* Top Visited Pages & Active Online Users Tables */}
                <div className={styles.chartsGrid} style={{ marginBottom: '30px' }}>
                    {/* Top Visited Pages */}
                    <div className={styles.chartCard} style={{ maxHeight: '450px', overflowY: 'auto' }}>
                        <h3>Top Visited Pages</h3>
                        <table style={{ width: '100%', borderCollapse: 'collapse', marginTop: '16px', fontSize: '0.9rem' }}>
                            <thead>
                                <tr style={{ borderBottom: '2px solid #f1f5f9', textAlign: 'left', color: '#64748b' }}>
                                    <th style={{ padding: '8px' }}>Page Path</th>
                                    <th style={{ padding: '8px', textAlign: 'right' }}>Page Views</th>
                                </tr>
                            </thead>
                            <tbody>
                                {traffic?.topPages && traffic.topPages.length > 0 ? (
                                    traffic.topPages.map((p, idx) => (
                                        <tr key={idx} style={{ borderBottom: '1px solid #f8fafc' }}>
                                            <td style={{ padding: '10px 8px', fontWeight: 500, fontFamily: 'monospace' }}>{p.path}</td>
                                            <td style={{ padding: '10px 8px', textAlign: 'right', fontWeight: 600 }}>{p.views.toLocaleString()}</td>
                                        </tr>
                                    ))
                                ) : (
                                    <tr>
                                        <td colSpan={2} style={{ padding: '16px', textAlign: 'center', color: '#94a3b8' }}>
                                            No page visits recorded yet
                                        </td>
                                    </tr>
                                )}
                            </tbody>
                        </table>
                    </div>

                    {/* Active Online Visitors Detail */}
                    <div className={styles.chartCard} style={{ maxHeight: '450px', overflowY: 'auto' }}>
                        <h3>Active Online Visitors Right Now</h3>
                        <table style={{ width: '100%', borderCollapse: 'collapse', marginTop: '16px', fontSize: '0.88rem' }}>
                            <thead>
                                <tr style={{ borderBottom: '2px solid #f1f5f9', textAlign: 'left', color: '#64748b' }}>
                                    <th style={{ padding: '8px' }}>Session ID</th>
                                    <th style={{ padding: '8px' }}>Current Page</th>
                                    <th style={{ padding: '8px' }}>Device</th>
                                    <th style={{ padding: '8px', textAlign: 'right' }}>Last Active</th>
                                </tr>
                            </thead>
                            <tbody>
                                {traffic?.activeVisitors && traffic.activeVisitors.length > 0 ? (
                                    traffic.activeVisitors.map((v, idx) => (
                                        <tr key={idx} style={{ borderBottom: '1px solid #f8fafc' }}>
                                            <td style={{ padding: '8px', fontFamily: 'monospace', fontSize: '0.8rem' }}>{v.sessionId}</td>
                                            <td style={{ padding: '8px', fontWeight: 500 }}>{v.path}</td>
                                            <td style={{ padding: '8px', textTransform: 'capitalize' }}>
                                                {v.deviceType === 'mobile' ? '📱 Mobile' : v.deviceType === 'tablet' ? '📲 Tablet' : '💻 Desktop'}
                                            </td>
                                            <td style={{ padding: '8px', textAlign: 'right', color: '#10b981', fontWeight: 600 }}>
                                                {v.minutesAgo === 0 ? 'Just now' : `${v.minutesAgo}m ago`}
                                            </td>
                                        </tr>
                                    ))
                                ) : (
                                    <tr>
                                        <td colSpan={4} style={{ padding: '24px', textAlign: 'center', color: '#94a3b8' }}>
                                            No active visitors right now
                                        </td>
                                    </tr>
                                )}
                            </tbody>
                        </table>
                    </div>
                </div>

                {/* Sales & Revenue Analytics Charts */}
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
