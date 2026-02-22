"use client";

import React from 'react';
import Link from 'next/link';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Navbar.module.css';
import { ShoppingBag, Menu, Search, Globe } from 'lucide-react';

const Navbar = () => {
    const { t, language, setLanguage } = useLanguage();

    const toggleLanguage = () => {
        setLanguage(language === 'en' ? 'ar' : 'en');
    };

    return (
        <nav className={styles.navbar}>
            <div className={styles.container}>
                <div className={styles.left}>
                    <button className={styles.menuButton}>
                        <Menu size={20} />
                    </button>
                    <div className={styles.navLinks}>
                        <Link href="/">{t('nav.home')}</Link>
                        <Link href="/shop">{t('nav.shop')}</Link>
                    </div>
                </div>

                <div className={styles.logo}>
                    <Link href="/">SEASONS</Link>
                </div>

                <div className={styles.right}>
                    <div className={styles.navLinks}>
                        <Link href="/about">{t('nav.about')}</Link>
                        <Link href="/contact">{t('nav.contact')}</Link>
                    </div>
                    <button onClick={toggleLanguage} className={styles.iconButton} aria-label="Toggle Language">
                        <Globe size={20} />
                        <span className={styles.langLabel}>{language.toUpperCase()}</span>
                    </button>
                    <button className={styles.iconButton}>
                        <Search size={20} />
                    </button>
                    <button className={styles.iconButton}>
                        <ShoppingBag size={20} />
                    </button>
                </div>
            </div>
        </nav>
    );
};

export default Navbar;
