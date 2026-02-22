"use client";

import React from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Hero.module.css';

const Hero = () => {
    const { t } = useLanguage();

    return (
        <section className={styles.hero}>
            <div className={styles.overlay}></div>
            <div className={styles.content}>
                <h1 className={styles.title}>{t('hero.title')}</h1>
                <p className={styles.subtitle}>{t('hero.subtitle')}</p>
                <div className={styles.actions}>
                    <button className="premium-button">{t('hero.cta')}</button>
                    <button className="ghost-button">{t('nav.about')}</button>
                </div>
            </div>
        </section>
    );
};

export default Hero;
