"use client";

import React from 'react';
import Link from 'next/link';
import { LayoutDashboard, ShoppingCart, Package, Settings, LogOut, BarChart3, Tag } from 'lucide-react';
import styles from './AdminLayout.module.css';

const AdminLayout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    return (
        <div className={styles.adminContainer}>
            <aside className={styles.sidebar}>
                <div className={styles.sidebarHeader}>
                    <h2>SEASONS</h2>
                    <span>Admin Panel</span>
                </div>

                <nav className={styles.nav}>
                    <Link href="/admin"><LayoutDashboard size={18} /> Dashboard</Link>
                    <Link href="/admin/orders"><ShoppingCart size={18} /> Orders</Link>
                    <Link href="/admin/products"><Package size={18} /> Products</Link>
                    <Link href="/admin/coupons"><Tag size={18} /> Coupons</Link>
                    <Link href="/admin/analytics"><BarChart3 size={18} /> Analytics</Link>
                    <Link href="/admin/settings"><Settings size={18} /> Settings</Link>
                </nav>

                <div className={styles.sidebarFooter}>
                    <button className={styles.logout}>
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
