"use client";

import React from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { useLanguage } from '@/context/LanguageContext';
import { useCart } from '@/context/CartContext';
import { useWishlist } from '@/context/WishlistContext';
import styles from './Navbar.module.css';
import { ShoppingBag, Menu, Search, Globe, Heart } from 'lucide-react';

const Navbar = () => {
    const { t, language, setLanguage, dir } = useLanguage();
    const { itemCount } = useCart();
    const { count: wishlistCount } = useWishlist();

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
                    <Link href="/">
                        <Image src="/images/mainlogo.png" alt="Seasons Logo" width={180} height={45} className={styles.logoImg} priority />
                    </Link>
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
                    {/* Wishlist */}
                    <Link href="/wishlist" className={styles.iconButton} aria-label="Wishlist">
                        <div className={styles.badgeWrapper}>
                            <Heart size={20} />
                            {wishlistCount > 0 && (
                                <span className={styles.badge}>{wishlistCount}</span>
                            )}
                        </div>
                    </Link>
                    {/* Cart */}
                    <Link href="/cart" className={styles.iconButton} aria-label="Cart">
                        <div className={styles.badgeWrapper}>
                            <ShoppingBag size={20} />
                            {itemCount > 0 && (
                                <span className={styles.badge}>{itemCount}</span>
                            )}
                        </div>
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
                    <Link href="/wishlist" onClick={() => setMenuOpen(false)}>❤️ Wishlist</Link>
                </div>
            )}
        </nav>
    );
};

export default Navbar;
