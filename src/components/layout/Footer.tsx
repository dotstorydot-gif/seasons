"use client";

import React from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Footer.module.css';

const Footer = () => {
    const { t, language } = useLanguage();

    return (
        <footer className={styles.footer}>
            <div className={styles.container}>
                <div className={styles.grid}>

                    {/* Brand */}
                    <div className={styles.brand}>
                        <Link href="/" className={styles.logoLink}>
                            <Image src="/images/logolight.png" alt="Seasons Logo" width={320} height={80} className={styles.logoImg} />
                        </Link>
                        <p className={styles.tagline}>
                            Handcrafted wooden pieces that bring warmth and elegance to your everyday life.
                        </p>
                        {/* Trust badges */}
                        <div className={styles.trustBadges}>
                            <div className={styles.badge}>
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" /></svg>
                                <span>SSL Secured</span>
                            </div>
                            <div className={styles.badge}>
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><rect x="1" y="4" width="22" height="16" rx="2" ry="2" /><line x1="1" y1="10" x2="23" y2="10" /></svg>
                                <span>Cash on Delivery</span>
                            </div>
                            <div className={styles.badge}>
                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><circle cx="12" cy="12" r="10" /><polyline points="12 6 12 12 16 14" /></svg>
                                <span>Fast Delivery</span>
                            </div>
                        </div>
                    </div>

                    {/* Navigate */}
                    <div className={styles.col}>
                        <h3 className={styles.colTitle}>NAVIGATE</h3>
                        <ul className={styles.colList}>
                            <li><Link href="/">{t('nav.home')}</Link></li>
                            <li><Link href="/shop">{t('nav.shop')}</Link></li>
                            <li><Link href="/about">{t('nav.about')}</Link></li>
                            <li><Link href="/contact">{t('nav.contact')}</Link></li>
                            <li><Link href="/wishlist">{language === 'en' ? '♥ Wishlist' : '♥ قائمة الأمنيات'}</Link></li>
                            <li><Link href="/track-order">{language === 'en' ? '📦 Track Order' : '📦 تتبع الطلب'}</Link></li>
                        </ul>
                    </div>

                    {/* Contact */}
                    <div className={styles.col}>
                        <h3 className={styles.colTitle}>CONTACT</h3>
                        <ul className={styles.colList}>
                            <li>hello@seasonsbynature.com</li>
                            <li>+20 100 000 0000</li>
                            <li>Cairo, Egypt</li>
                        </ul>
                        <div className={styles.legalLinks}>
                            <Link href="/privacy-policy">{language === 'en' ? 'Privacy Policy' : 'سياسة الخصوصية'}</Link>
                            <Link href="/terms-conditions">{language === 'en' ? 'Terms & Conditions' : 'الشروط والأحكام'}</Link>
                        </div>
                        <div className={styles.securityNote}>
                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><polyline points="20 6 9 17 4 12" /></svg>
                            {language === 'en' ? "HTTPS Encrypted — Verified by Let's Encrypt" : "مشفر بـ HTTPS — تم التحقق منه بواسطة Let's Encrypt"}
                        </div>
                    </div>

                </div>
            </div>

            <div className={styles.bottom}>
                <p>© {new Date().getFullYear()} Seasons by Nature. All rights reserved.</p>
                <p className={styles.bottomNote}>Secure checkout · Your data is never shared</p>
            </div>
        </footer>
    );
};

export default Footer;
