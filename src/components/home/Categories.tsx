"use client";

import React from 'react';
import styles from './Categories.module.css';

const CATEGORIES = [
    { id: '1', nameEn: 'Seating', nameAr: 'المقاعد', color: '#E5E1DA' },
    { id: '2', nameEn: 'Tables', nameAr: 'الطاولات', color: '#D4CFC9' },
    { id: '3', nameEn: 'Lighting', nameAr: 'الإضاءة', color: '#C3BEB8' },
    { id: '4', nameEn: 'Decor', nameAr: 'الديكور', color: '#B2ADA7' }
];

const Categories = () => {
    return (
        <section className={styles.categories}>
            <div className={styles.container}>
                <div className={styles.header}>
                    <h2 className={styles.title}>Browse Categories</h2>
                </div>
                <div className={styles.grid}>
                    {CATEGORIES.map(cat => (
                        <div key={cat.id} className={styles.categoryCard}>
                            <div className={styles.imagePlaceholder} style={{ backgroundColor: cat.color }}></div>
                            <div className={styles.label}>
                                <h3>{cat.nameEn}</h3>
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
};

export default Categories;
