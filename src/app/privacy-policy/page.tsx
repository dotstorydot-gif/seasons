"use client";

import React from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Legal.module.css';

export default function PrivacyPolicy() {
    const { language } = useLanguage();

    const enText = (
        <div className={styles.content}>
            <h1>Privacy Policy</h1>
            <p>Last updated: {new Date().toLocaleDateString()}</p>

            <h2>1. Information We Collect</h2>
            <p>At Seasons by Nature, we collect personal information you provide when placing an order, including your name, shipping address, phone number, and email. We only use this information to process and deliver your handcrafted wooden products securely across Egypt.</p>

            <h2>2. How We Use Your Information</h2>
            <p>Your data is used exclusively to fulfill your orders, communicate delivery updates, and provide customer support. We do not sell, rent, or trade your personal information to third parties.</p>

            <h2>3. Data Security</h2>
            <p>We implement strict security measures to protect your personal information. Our website uses SSL encryption to ensure that your data is transmitted securely.</p>

            <h2>4. Contact Us</h2>
            <p>If you have any questions about this Privacy Policy, please contact us at support@seasonsbynature.com or via WhatsApp at +20100000000.</p>
        </div>
    );

    const arText = (
        <div className={styles.content} dir="rtl">
            <h1>سياسة الخصوصية</h1>
            <p>آخر تحديث: {new Date().toLocaleDateString('ar-EG')}</p>

            <h2>1. المعلومات التي نجمعها</h2>
            <p>في سيزونز، نقوم بجمع المعلومات الشخصية التي تقدمها عند تقديم طلب، بما في ذلك اسمك وعنوان الشحن ورقم الهاتف والبريد الإلكتروني. نستخدم هذه المعلومات فقط لمعالجة وتوصيل منتجاتنا الخشبية المصنوعة يدويًا بأمان في جميع أنحاء مصر.</p>

            <h2>2. كيف نستخدم معلوماتك</h2>
            <p>تستخدم بياناتك حصريًا لتلبية طلباتك والتواصل بشأن تحديثات التوصيل وتقديم دعم العملاء. نحن لا نبيع أو نؤجر أو نتاجر بمعلوماتك الشخصية مع أطراف ثالثة.</p>

            <h2>3. أمان البيانات</h2>
            <p>نقوم بتنفيذ تدابير أمنية صارمة لحماية معلوماتك الشخصية. يستخدم موقعنا تشفير SSL لضمان نقل بياناتك بأمان.</p>

            <h2>4. اتصل بنا</h2>
            <p>إذا كانت لديك أي أسئلة حول سياسة الخصوصية هذه، يرجى الاتصال بنا عبر البريد الإلكتروني support@seasonsbynature.com أو عبر واتساب على الرقم +20100000000.</p>
        </div>
    );

    return (
        <div className={styles.page}>
            <div className={styles.container}>
                {language === 'en' ? enText : arText}
            </div>
        </div>
    );
}
