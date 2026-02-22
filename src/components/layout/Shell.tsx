"use client";

import React from 'react';
import { usePathname } from 'next/navigation';
import Navbar from './Navbar';
import Footer from './Footer';
import styles from './Shell.module.css';

const Shell: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    const pathname = usePathname();
    const isAdmin = pathname?.startsWith('/admin');

    return (
        <div className={styles.shell}>
            {!isAdmin && <Navbar />}
            <main className={styles.main}>
                {children}
            </main>
            {!isAdmin && <Footer />}
        </div>
    );
};

export default Shell;
