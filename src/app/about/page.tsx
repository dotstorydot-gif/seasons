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
    {
        icon: ShieldCheck,
        label: 'Food-safe',
        desc: 'Every piece is finished with food-safe oils, making it safe for direct contact with your meals and ingredients.',
    },
    {
        icon: Leaf,
        label: 'Naturally durable',
        desc: 'Our hardwood is chosen for its strength and longevity — built to last a lifetime with minimal care.',
    },
    {
        icon: Droplets,
        label: 'Moisture resistant',
        desc: 'Naturally resistant to moisture and daily wear, keeping its beauty through years of use.',
    },
    {
        icon: Sparkles,
        label: 'Beautiful grain',
        desc: 'Each piece highlights the natural texture and grain of wood — no two are ever exactly alike.',
    },
];

const materialsAr = [
    {
        icon: ShieldCheck,
        label: 'آمن للتلامس مع الطعام',
        desc: 'كل قطعة مشطوبة بزيوت آمنة غذائيًا، مما يجعلها مناسبة للتلامس المباشر مع الطعام.',
    },
    {
        icon: Leaf,
        label: 'متانة طبيعية',
        desc: 'نختار أخشابًا صلبة لقوتها وطول عمرها — مصممة لتدوم مدى الحياة بعناية بسيطة.',
    },
    {
        icon: Droplets,
        label: 'مقاوم للرطوبة',
        desc: 'مقاوم بشكل طبيعي للرطوبة والاستخدام اليومي، يحافظ على جماله لسنوات.',
    },
    {
        icon: Sparkles,
        label: 'جمال التفصيل',
        desc: 'تُبرز كل قطعة الملمس الطبيعي للخشب — لا توجد قطعتان متطابقتان تمامًا.',
    },
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
            </div>

            {/* Material Highlights — full-width cream section */}
            <section className={styles.materialsSection}>
                <h2 className={styles.materialsTitle}>
                    {language === 'en' ? 'What Makes Our Wood Special' : 'ما الذي يجعل خشبنا مميزًا'}
                </h2>
                <div className={styles.materialsGrid}>
                    {materials.map(({ icon: Icon, label, desc }) => (
                        <div key={label} className={styles.materialCard}>
                            <Icon size={30} className={styles.materialIcon} strokeWidth={1.2} />
                            <h3 className={styles.materialLabel}>{label}</h3>
                            <p className={styles.materialDesc}>{desc}</p>
                        </div>
                    ))}
                </div>
            </section>
        </div>
    );
}
