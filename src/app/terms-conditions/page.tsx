"use client";

import React from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from '../privacy-policy/Legal.module.css';

export default function TermsConditions() {
    const { language } = useLanguage();

    const enText = (
        <div className={styles.content}>
            <h1>Terms & Conditions</h1>
            <p>Last updated: {new Date().toLocaleDateString()}</p>

            <h2>1. General Terms</h2>
            <p>By accessing and placing an order with Seasons by Nature, you confirm that you are in agreement with and bound by the terms of service contained in the Terms & Conditions outlined below. These terms apply to the entire website and any email or other type of communication between you and Seasons by Nature.</p>

            <h2>2. Products and Pricing</h2>
            <p>All our wooden products are handcrafted in Egypt. Product images are for illustrative purposes and slight variations in wood grain and color may occur. All prices are listed in Egyptian Pounds (EGP).</p>

            <h2>3. Returns and Cancellations</h2>
            <p>You may cancel your order at any time before it is shipped. If you receive a damaged or incorrect item, please contact our support team within 48 hours of delivery for a return or exchange. Custom-made items are non-refundable.</p>

            <h2>4. Shipping Policy</h2>
            <p>We deliver across all governorates in Egypt. Standard shipping takes 3-5 business days. You will be notified of any delays caused by unforeseen circumstances.</p>
        </div>
    );

    const arText = (
        <div className={styles.content} dir="rtl">
            <h1>الشروط والأحكام</h1>
            <p>آخر تحديث: {new Date().toLocaleDateString('ar-EG')}</p>

            <h2>1. شروط عامة</h2>
            <p>من خلال الوصول إلى وتقديم طلب مع سيزونز، فإنك تؤكد موافقتك والتزامك بشروط الخدمة الواردة في الشروط والأحكام الموضحة أدناه. تنطبق هذه الشروط على الموقع بأكمله وأي بريد إلكتروني أو نوع آخر من التواصل بينك وبين سيزونز.</p>

            <h2>2. المنتجات والتسعير</h2>
            <p>جميع منتجاتنا الخشبية مصنوعة يدويًا في مصر. صور المنتجات هي لأغراض توضيحية وقد تحدث اختلافات طفيفة في عروق الخشب واللون. جميع الأسعار مدرجة بالجنيه المصري.</p>

            <h2>3. الإرجاع والإلغاء</h2>
            <p>يمكنك إلغاء طلبك في أي وقت قبل شحنه. إذا استلمت عنصرًا تالفًا أو غير صحيح، يرجى الاتصال بفريق الدعم لدينا في غضون 48 ساعة من الاستلام للإرجاع أو الاستبدال. العناصر المصنوعة خصيصًا غير قابلة للاسترداد.</p>

            <h2>4. سياسة الشحن</h2>
            <p>نقوم بالتوصيل عبر جميع المحافظات في مصر. يستغرق الشحن القياسي من 3 إلى 5 أيام عمل. سيتم إعلامك بأي تأخير ناتج عن ظروف غير متوقعة.</p>
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
