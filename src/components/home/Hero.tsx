"use client";

import React from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Hero.module.css';
import Image from 'next/image';

const Hero = () => {
    const { t } = useLanguage();

    return (
        <section className={styles.hero}>
            <Image
                src="/images/hero-banner.png"
                alt="Seasons by Nature Banner"
                fill
                priority
                className={styles.heroImage}
                style={{ objectFit: 'cover' }}
            />
            <div className={styles.overlay}></div>
            <div className={styles.content}>
                <h1 className={styles.title}>
                    {t('hero.title').split('\n').map((line, i) => (
                        <span key={i}>{line}{i === 0 ? <br /> : null}</span>
                    ))}
                </h1>
                <p className={styles.subtitle}>{t('hero.subtitle')}</p>
                <div className={styles.actions}>
                    <button className="hero-button-primary">{t('hero.cta')}</button>
                    <button className="hero-button-ghost">{t('nav.about')}</button>
                </div>
            </div>
        </section>
    );
};

export default Hero;
