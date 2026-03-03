"use client";

import React from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './ProductCare.module.css';
import {
    Droplets,
    Sun,
    Thermometer,
    Zap,
    Sparkles,
    ShieldCheck,
    Heart,
    HandMetal
} from 'lucide-react';

const ProductCareGuide = () => {
    const { language, dir } = useLanguage();

    return (
        <div className={styles.page} dir={dir}>
            <div className={styles.container}>
                <header className={styles.header}>
                    <Heart className={styles.mainIcon} size={48} />
                    <h1>{language === 'en' ? 'Product Care Guide' : 'دليل العناية بالمنتجات'}</h1>
                    <p className={styles.subtitle}>
                        {language === 'en'
                            ? 'Caring for Your Handcrafted Wood'
                            : 'العناية بالأخشاب المصنوعة يدويًا'}
                    </p>
                </header>

                <section className={styles.intro}>
                    <p>
                        {language === 'en'
                            ? "Thank you for bringing a piece of Seasons by Nature into your home. Wood is a living, natural material that develops character over time. With a little love, your piece will last for generations."
                            : "شكرًا لاقتنائك قطعة من سيزونز باي نيتشر في منزلك. الخشب مادة طبيعية حية تكتسب طابعًا خاصًا بمرور الوقت. مع القليل من الاهتمام، ستدوم قطعتك لأجيال."}
                    </p>
                </section>

                <div className={styles.grid}>
                    {/* Daily Care */}
                    <div className={styles.card}>
                        <div className={styles.cardHeader}>
                            <Sparkles className={styles.icon} />
                            <h2>{language === 'en' ? 'Daily Care' : 'العناية اليومية'}</h2>
                        </div>
                        <ul className={styles.list}>
                            <li>
                                <strong>{language === 'en' ? 'Dust Regularly:' : 'إزالة الغبار بانتظام:'}</strong>
                                {language === 'en'
                                    ? ' Use a soft, dry microfiber cloth to gently dust your piece.'
                                    : ' استخدم قطعة قماش ناعمة وجافة من المايكروفايبر لمسح قطعتك برفق.'}
                            </li>
                            <li>
                                <strong>{language === 'en' ? 'Clean Spills Immediately:' : 'تنظيف السوائل فوراً:'}</strong>
                                {language === 'en'
                                    ? ' Wipe up any liquids right away with a clean, dry cloth. Do not let water sit on the surface.'
                                    : ' امسح أي سوائل على الفور بقطعة قماش نظيفة وجافة. لا تترك الماء على السطح.'}
                            </li>
                        </ul>
                    </div>

                    {/* Cleaning Do's & Don'ts */}
                    <div className={styles.card}>
                        <div className={styles.cardHeader}>
                            <ShieldCheck className={styles.icon} />
                            <h2>{language === 'en' ? "Cleaning Do's & Don'ts" : 'ما يجب فعله وما لا يجب'}</h2>
                        </div>
                        <ul className={styles.list}>
                            <li className={styles.do}>
                                <strong>DO</strong> {language === 'en'
                                    ? 'use a cloth slightly dampened with water and a drop of mild soap for stubborn spots.'
                                    : 'استخدم قطعة قماش مبللة قليلاً بالماء مع قطرة من صابون لطيف للبقع الصعبة.'}
                            </li>
                            <li className={styles.dont}>
                                <strong>DO NOT</strong> {language === 'en'
                                    ? 'use harsh chemicals, bleach, ammonia, or abrasive pads.'
                                    : 'لا تستخدم المواد الكيميائية القاسية أو المبيضات أو الأمونيا.'}
                            </li>
                            <li className={styles.dont}>
                                <strong>DO NOT</strong> {language === 'en'
                                    ? 'use silicone-based polishes; they build up a film that dulls the wood.'
                                    : 'لا تستخدم ملمعات السيليكون؛ فهي تراكم طبقة تفقد الخشب بريقه.'}
                            </li>
                            <li className={styles.dont}>
                                <strong>NEVER</strong> {language === 'en'
                                    ? 'put your wooden pieces in the dishwasher or soak them in water.'
                                    : 'لا تضع قطع الخشب أبداً في غسالة الأطباق أو تنقعها في الماء.'}
                            </li>
                        </ul>
                    </div>

                    {/* Preventative Care */}
                    <div className={styles.card}>
                        <div className={styles.cardHeader}>
                            <Zap className={styles.icon} />
                            <h2>{language === 'en' ? 'Preventative Care' : 'العناية الوقائية'}</h2>
                        </div>
                        <ul className={styles.list}>
                            <li>
                                <Droplets size={16} className={styles.inlineIcon} />
                                <strong>{language === 'en' ? 'Avoid Heat & Moisture:' : 'تجنب الحرارة والرطوبة:'}</strong>
                                {language === 'en'
                                    ? ' Always use coasters, placemats, or trivets under hot dishes and drinks.'
                                    : ' استخدم دائماً قواعد الأكواب أو المفارش تحت الأطباق والمشروبات الساخنة.'}
                            </li>
                            <li>
                                <Sun size={16} className={styles.inlineIcon} />
                                <strong>{language === 'en' ? 'Mind the Sun:' : 'احذر الشمس:'}</strong>
                                {language === 'en'
                                    ? ' Avoid placing items in direct, harsh sunlight for long periods to prevent fading.'
                                    : ' تجنب وضع القطع في ضوء الشمس المباشر لفترات طويلة لمنع البهتان.'}
                            </li>
                            <li>
                                <Thermometer size={16} className={styles.inlineIcon} />
                                <strong>{language === 'en' ? 'Stable Environment:' : 'بيئة مستقرة:'}</strong>
                                {language === 'en'
                                    ? ' Keep your piece in a room with consistent temperature, away from radiators.'
                                    : ' حافظ على قطعتك في غرفة ذات درجة حرارة ثابتة، بعيداً عن أجهزة التتدفئة.'}
                            </li>
                        </ul>
                    </div>

                    {/* Maintenance */}
                    <div className={styles.card}>
                        <div className={styles.cardHeader}>
                            <HandMetal className={styles.icon} />
                            <h2>{language === 'en' ? 'Ongoing Maintenance' : 'الصيانة المستمرة'}</h2>
                        </div>
                        <p className={styles.cardIntro}>
                            {language === 'en'
                                ? 'If your piece feels dry, nourish it with a natural oil.'
                                : 'إذا شعرت بجفاف الخشب، يمكنك تغذيته بزيت طبيعي.'}
                        </p>
                        <div className={styles.subSection}>
                            <h3>{language === 'en' ? 'What to use:' : 'ماذا تستخدم:'}</h3>
                            <p>{language === 'en' ? 'Food-safe mineral oil, beeswax polish, or olive oil.' : 'زيت معدني آمن للطعام، شمع العسل، أو زيت الزيتون.'}</p>
                        </div>
                        <div className={styles.subSection}>
                            <h3>{language === 'en' ? 'How often:' : 'كم مرة:'}</h3>
                            <p>{language === 'en' ? 'Every 3-6 months, or whenever the wood looks thirsty.' : 'كل ٣-٦ أشهر، أو عندما يبدو الخشب جافاً.'}</p>
                        </div>
                    </div>
                </div>

                <footer className={styles.pageFooter}>
                    <p>
                        {language === 'en'
                            ? "By following these simple steps, your Seasons by Nature piece will continue to bring warmth and elegance to your everyday life for years to come."
                            : "باتباع هذه الخطوات البسيطة، ستستمر قطعة سيزونز باي نيتشر في إضفاء الدفء والأناقة على حياتك اليومية لسنوات قادمة."}
                    </p>
                </footer>
            </div>
        </div>
    );
};

export default ProductCareGuide;
