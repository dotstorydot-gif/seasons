"use client";

import React from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './About.module.css';

export default function AboutPage() {
    const { t, dir } = useLanguage();

    return (
        <div className={styles.aboutPage} dir={dir}>
            <div className={styles.container}>
                <header className={styles.header}>
                    <h1>{t('nav.about')}</h1>
                </header>

                <div className={styles.content}>
                    <div className={styles.textSection}>
                        <h2>Our Story</h2>
                        <p>
                            Seasons By Nature was born from a deep appreciation for the organic beauty of wood.
                            Our journey started with a simple vision: to bring the tranquility of nature into modern homes
                            through handcrafted, sustainable wooden pieces.
                        </p>
                        <p>
                            Every item in our collection is carefully crafted by skilled artisans,
                            ensuring that no two pieces are exactly alike. We believe in "Slow Living"
                            and the enduring quality of natural materials.
                        </p>
                    </div>
                    <div className={styles.imageSection}>
                        <img
                            src="https://images.unsplash.com/photo-1581578017093-cd30fce4eeb7?auto=format&fit=crop&q=80"
                            alt="Artisan at work"
                        />
                    </div>
                </div>
            </div>
        </div>
    );
}
