"use client";

import React, { useState, useEffect } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { useRouter } from 'next/navigation';
import { LayoutDashboard, ShoppingCart, Package, Settings, LogOut, BarChart3, Tag, Star } from 'lucide-react';
import { adminHeaders } from '@/lib/adminHeaders';

import styles from './AdminLayout.module.css';

const AdminLayout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    const router = useRouter();
    const [reviewCount, setReviewCount] = useState<number | null>(null);
    const [onlineCount, setOnlineCount] = useState<number | null>(null);

    useEffect(() => {
        const fetchMeta = async () => {
            try {
                const [revRes, trafRes] = await Promise.allSettled([
                    fetch('/api/admin/reviews', { headers: adminHeaders() }),
                    fetch('/api/admin/traffic', { headers: adminHeaders() }),
                ]);

                if (revRes.status === 'fulfilled' && revRes.value.ok) {
                    const revData = await revRes.value.json();
                    if (Array.isArray(revData.reviews)) setReviewCount(revData.reviews.length);
                }

                if (trafRes.status === 'fulfilled' && trafRes.value.ok) {
                    const trafData = await trafRes.value.json();
                    if (typeof trafData.onlineNow === 'number') setOnlineCount(trafData.onlineNow);
                }
            } catch {
                // Silent catch for layout counters
            }
        };

        fetchMeta();
        const interval = setInterval(fetchMeta, 15000);
        return () => clearInterval(interval);
    }, []);

    return (
        <div className={styles.adminContainer}>
            <aside className={styles.sidebar}>
                <div className={styles.sidebarHeader}>
                    <Image src="/images/logolight.png" alt="Seasons Admin" width={220} height={55} className={styles.logoImg} />
                    <span>Admin Panel</span>
                </div>

                <nav className={styles.nav}>
                    <Link href="/admin"><LayoutDashboard size={18} /> Dashboard</Link>
                    <Link href="/admin/orders"><ShoppingCart size={18} /> Orders</Link>
                    <Link href="/admin/products"><Package size={18} /> Products</Link>
                    <Link href="/admin/coupons"><Tag size={18} /> Coupons</Link>
                    <Link href="/admin/reviews" style={{ justifyContent: 'space-between', display: 'flex', alignItems: 'center' }}>
                        <span style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                            <Star size={18} /> Reviews
                        </span>
                        {reviewCount !== null && (
                            <span style={{
                                backgroundColor: 'rgba(234, 179, 8, 0.2)',
                                color: '#eab308',
                                padding: '2px 8px',
                                borderRadius: '12px',
                                fontSize: '0.75rem',
                                fontWeight: 600,
                            }}>
                                {reviewCount}
                            </span>
                        )}
                    </Link>
                    <Link href="/admin/analytics" style={{ justifyContent: 'space-between', display: 'flex', alignItems: 'center' }}>
                        <span style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                            <BarChart3 size={18} /> Analytics
                        </span>
                        {onlineCount !== null && (
                            <span style={{
                                backgroundColor: 'rgba(16, 185, 129, 0.2)',
                                color: '#10b981',
                                padding: '2px 8px',
                                borderRadius: '12px',
                                fontSize: '0.75rem',
                                fontWeight: 600,
                            }}>
                                🟢 {onlineCount}
                            </span>
                        )}
                    </Link>
                    <Link href="/admin/settings"><Settings size={18} /> Settings</Link>
                </nav>

                <div className={styles.sidebarFooter}>
                    <button className={styles.logout} onClick={() => router.push('/admin/login')}>
                        <LogOut size={18} /> Logout
                    </button>
                </div>
            </aside>

            <main className={styles.content}>
                {children}
            </main>
        </div>
    );
};

export default AdminLayout;
