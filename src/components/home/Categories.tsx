"use client";

import React, { useState, useEffect } from 'react';
import styles from './Categories.module.css';
import { supabase } from '@/lib/supabase';
import { useLanguage } from '@/context/LanguageContext';
import Link from 'next/link';

const Categories = () => {
    const [categories, setCategories] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const { language } = useLanguage();

    useEffect(() => {
        const fetchCategories = async () => {
            setLoading(true);
            const { data } = await supabase.from('categories').select('*').order('sort_order', { ascending: true });
            if (data) setCategories(data);
            setLoading(false);
        };
        fetchCategories();
    }, []);

    return (
        <section className={styles.categories}>
            <div className={styles.container}>
                <div className={styles.header}>
                    <h2 className={styles.title}>Browse Categories</h2>
                </div>

                {loading ? (
                    <div className={styles.loading}>Exploring categories...</div>
                ) : categories.length > 0 ? (
                    <div className={styles.grid}>
                        {categories.map(cat => (
                            <Link href={`/shop?category=${cat.id}`} key={cat.id} className={styles.categoryCard}>
                                <div className={styles.imagePlaceholder} style={{ backgroundColor: '#E5E1DA' }}>
                                    {cat.image_url && <img src={cat.image_url} alt={cat.name_en} className={styles.categoryImage} />}
                                </div>
                                <div className={styles.label}>
                                    <h3>{language === 'en' ? cat.name_en : cat.name_ar}</h3>
                                </div>
                            </Link>
                        ))}
                    </div>
                ) : (
                    <div className={styles.empty}>
                        <p>No categories found. Please check your database setup.</p>
                    </div>
                )}
            </div>
        </section>
    );
};

export default Categories;
