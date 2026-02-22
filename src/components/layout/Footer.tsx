"use client";

import React from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Footer.module.css';

const Footer = () => {
    const { t } = useLanguage();

    return (
        <footer className={styles.footer}>
            <div className={styles.container}>
                <div className={styles.brand}>
                    <h2 className={styles.logo}>SEASONS</h2>
                    <p className={styles.tagline}>{t('hero.subtitle')}</p>
                </div>

                <div className={styles.links}>
                    <div>
                        <h3>SHOP</h3>
                        <ul>
                            <li>New Arrivals</li>
                            <li>Furniture</li>
                            <li>Decor</li>
                            <li>Lighting</li>
                        </ul>
                    </div>
                    <div>
                        <h3>SUPPORT</h3>
                        <ul>
                            <li>Contact Us</li>
                            <li>Shipping & Returns</li>
                            <li>FAQ</li>
                            <li>Care Guide</li>
                        </ul>
                    </div>
                </div>

                <div className={styles.bottom}>
                    <p>&copy; {new Date().getFullYear()} SEASONS REIMAGINED. ALL RIGHTS RESERVED.</p>
                </div>
            </div>
        </footer>
    );
};

export default Footer;
