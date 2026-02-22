"use client";

import React from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './About.module.css';
import { ShieldCheck, Leaf, Droplets, Sparkles } from 'lucide-react';

const storyEn = {
    title: 'Our Story',
    p1: "Seasons Wooden Aesthetic was born from a mother's love for gathering her family and an engineer's passion for thoughtful design.",
    p2: "What began as creating warm, meaningful table settings at home grew into handcrafted wooden pieces that blend precision, beauty, and soul.",
    p3: "From serving boards to seasonal treasures, every piece is made to turn simple moments into lasting memories.",
};

const storyAr = {
    title: 'قصتنا',
    p1: 'وُلد نظام "سيزونز" من حبّ أمٍّ لجمع عائلتها، وشغف مهندسة بالتصميم الجميل والمدروس.',
    p2: 'ما بدأ بخلق أجواء دافئة ومميّزة في المنزل، تحوّل إلى قطع خشبية مصنوعة يدويًا تجمع بين الدقة والجمال والروح.',
    p3: 'من ألواح التقديم إلى هدايا المواسم، كل قطعة صُنعت لتحوّل اللحظات البسيطة إلى ذكريات خالدة.',
};

const materialsEn = [
    { icon: ShieldCheck, label: 'Food-safe' },
    { icon: Leaf, label: 'Naturally durable' },
    { icon: Droplets, label: 'Resistant to moisture and wear' },
    { icon: Sparkles, label: 'Beautiful in texture and grain' },
];

const materialsAr = [
    { icon: ShieldCheck, label: 'آمن للتلامس مع الطعام' },
    { icon: Leaf, label: 'متانة طبيعية' },
    { icon: Droplets, label: 'مقاوم للرطوبة والاهتراء' },
    { icon: Sparkles, label: 'جمال في الملمس والتفصيل' },
];

export default function AboutPage() {
    const { language, dir } = useLanguage();
    const story = language === 'en' ? storyEn : storyAr;
    const materials = language === 'en' ? materialsEn : materialsAr;

    return (
        <div className={styles.aboutPage} dir={dir}>
            <div className={styles.container}>
                <header className={styles.header}>
                    <h1>{language === 'en' ? 'About Us' : 'من نحن'}</h1>
                </header>

                {/* Story Section */}
                <div className={styles.content}>
                    <div className={styles.textSection}>
                        <h2>{story.title}</h2>
                        <p>{story.p1}</p>
                        <p>{story.p2}</p>
                        <p>{story.p3}</p>
                    </div>
                    <div className={styles.imageSection}>
                        <img
                            src="/images/abotus.png"
                            alt="Seasons by Nature — Our Story"
                        />
                    </div>
                </div>

                {/* Material Highlights */}
                <section className={styles.materialsSection}>
                    <h2 className={styles.materialsTitle}>
                        {language === 'en' ? 'What Makes Our Wood Special' : 'ما الذي يجعل خشبنا مميزًا'}
                    </h2>
                    <div className={styles.materialsGrid}>
                        {materials.map(({ icon: Icon, label }) => (
                            <div key={label} className={styles.materialCard}>
                                <Icon size={32} className={styles.materialIcon} strokeWidth={1.5} />
                                <p>{label}</p>
                            </div>
                        ))}
                    </div>
                </section>
            </div>
        </div>
    );
}
