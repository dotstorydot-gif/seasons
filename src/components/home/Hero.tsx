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
                <h1 className={styles.title}>
                    {t('hero.title').split('\n').map((line, i) => (
                        <span key={i}>{line}{i === 0 ? <br /> : null}</span>
                    ))}
                </h1>
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
