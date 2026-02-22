"use client";

import React from 'react';
import Link from 'next/link';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Navbar.module.css';
import { ShoppingBag, Menu, Search, Globe } from 'lucide-react';

const Navbar = () => {
    const { t, language, setLanguage } = useLanguage();

    const [menuOpen, setMenuOpen] = React.useState(false);

    const toggleLanguage = () => {
        setLanguage(language === 'en' ? 'ar' : 'en');
    };

    return (
        <nav className={styles.navbar}>
            <div className={styles.container}>
                <div className={styles.left}>
                    <button className={styles.menuButton} onClick={() => setMenuOpen(!menuOpen)}>
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
                    <Link href="/checkout" className={styles.iconButton}>
                        <ShoppingBag size={20} />
                    </Link>
                </div>
            </div>

            {/* Mobile Menu */}
            {menuOpen && (
                <div className={styles.mobileMenu} dir={dir}>
                    <Link href="/" onClick={() => setMenuOpen(false)}>{t('nav.home')}</Link>
                    <Link href="/shop" onClick={() => setMenuOpen(false)}>{t('nav.shop')}</Link>
                    <Link href="/about" onClick={() => setMenuOpen(false)}>{t('nav.about')}</Link>
                    <Link href="/contact" onClick={() => setMenuOpen(false)}>{t('nav.contact')}</Link>
                </div>
            )}
        </nav>
    );
};

export default Navbar;
