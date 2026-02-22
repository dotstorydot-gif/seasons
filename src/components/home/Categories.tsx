"use client";

import React, { useState, useEffect } from 'react';
import styles from './Categories.module.css';
import { supabase } from '@/lib/supabase';
import { useLanguage } from '@/context/LanguageContext';
import Link from 'next/link';
import Image from 'next/image';

interface Category {
    id: string;
    name_en: string;
    name_ar: string;
    image_url?: string;
    sort_order?: number;
}

const Categories = () => {
    const [categories, setCategories] = useState<Category[]>([]);
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
                            <Link key={cat.id} href={`/shop?category=${cat.id}`} className={styles.categoryCard}>
                                <div className={styles.imagePlaceholder}>
                                    {cat.image_url && (
                                        <Image
                                            src={cat.image_url}
                                            alt={language === 'en' ? cat.name_en : cat.name_ar}
                                            fill
                                            className={styles.categoryImage}
                                        />
                                    )}
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
