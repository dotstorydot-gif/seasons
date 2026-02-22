"use client";

import React from 'react';
import Link from 'next/link';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Footer.module.css';

const Footer = () => {
    const { t } = useLanguage();

    return (
        <footer className={styles.footer}>
            <div className={styles.container}>
                <div className={styles.grid}>

                    {/* Brand */}
                    <div className={styles.brand}>
                        <h2 className={styles.logo}>SEASONS</h2>
                        <p className={styles.tagline}>
                            Handcrafted wooden pieces that bring warmth and elegance to your everyday life.
                        </p>
                    </div>

                    {/* Navigate */}
                    <div className={styles.col}>
                        <h3 className={styles.colTitle}>NAVIGATE</h3>
                        <ul className={styles.colList}>
                            <li><Link href="/">{t('nav.home')}</Link></li>
                            <li><Link href="/shop">{t('nav.shop')}</Link></li>
                            <li><Link href="/about">{t('nav.about')}</Link></li>
                            <li><Link href="/contact">{t('nav.contact')}</Link></li>
                        </ul>
                    </div>

                    {/* Contact */}
                    <div className={styles.col}>
                        <h3 className={styles.colTitle}>CONTACT</h3>
                        <ul className={styles.colList}>
                            <li>hello@seasonswoodenco.com</li>
                            <li>+20 100 000 0000</li>
                            <li>Cairo, Egypt</li>
                        </ul>
                    </div>

                </div>
            </div>

            <div className={styles.bottom}>
                <p>&copy; {new Date().getFullYear()} Seasons Wooden. All rights reserved.</p>
            </div>
        </footer>
    );
};

export default Footer;
