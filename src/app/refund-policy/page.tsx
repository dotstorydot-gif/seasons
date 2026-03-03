"use client";

import React from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from '../privacy-policy/Legal.module.css';
import { ShieldAlert, RotateCcw, Package, Truck, CreditCard, RefreshCw } from 'lucide-react';

export default function RefundPolicy() {
    const { language } = useLanguage();

    const enText = (
        <div className={styles.content}>
            <header className={styles.legalHeader}>
                <RotateCcw className={styles.mainIcon} size={48} />
                <h1>Refund & Exchange Policy</h1>
                <p className={styles.updated}>Last updated: {new Date().toLocaleDateString()}</p>
            </header>

            <section className={styles.intro}>
                <h2>Our Promise</h2>
                <p>At Seasons by Nature, we want you to love your handcrafted wooden pieces as much as we do. Because each item is unique and made by hand, we ask that you review your order carefully upon receipt.</p>
            </section>

            <div className={styles.legalGrid}>
                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <ShieldAlert size={24} />
                        <h3>Eligibility for Returns</h3>
                    </div>
                    <p>You may return your item within 14 days of delivery if:</p>
                    <ul>
                        <li>The item arrives damaged or defective.</li>
                        <li>You have received the wrong item.</li>
                    </ul>
                </div>

                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <Package size={24} />
                        <h3>Non-Returnable Items</h3>
                    </div>
                    <p>Due to the handcrafted nature of our products, we cannot accept returns for:</p>
                    <ul>
                        <li>Change of mind (as each piece is made to order).</li>
                        <li>Items that have been used, altered, or show signs of wear.</li>
                    </ul>
                </div>

                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <Truck size={24} />
                        <h3>Process for Returns</h3>
                    </div>
                    <ol>
                        <li><strong>Contact Us:</strong> Email us at info@seasonsbynature.com with your order number and a photo of the damage or defect.</li>
                        <li><strong>Approval:</strong> If your return is approved, we will contact you to provide instruction on how to return the item back.</li>
                        <li><strong>Shipping:</strong> Return shipping costs will be covered by Seasons by Nature for damaged or incorrect items.</li>
                    </ol>
                </div>

                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <CreditCard size={24} />
                        <h3>Refunds</h3>
                    </div>
                    <p>Once we receive and inspect your return, we will notify you of the approval or rejection of your refund. If approved, your refund will be processed automatically to your original method of payment within 5-10 business days.</p>
                </div>

                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <RefreshCw size={24} />
                        <h3>Exchanges</h3>
                    </div>
                    <p>If you need a different item, please place a new order for the correct piece and return the original following the process above.</p>
                </div>
            </div>
        </div>
    );

    const arText = (
        <div className={styles.content} dir="rtl">
            <header className={styles.legalHeader}>
                <RotateCcw className={styles.mainIcon} size={48} />
                <h1>سياسة الاستبدال والاسترجاع</h1>
                <p className={styles.updated}>آخر تحديث: {new Date().toLocaleDateString('ar-EG')}</p>
            </header>

            <section className={styles.intro}>
                <h2>وعدنا لكم</h2>
                <p>في سيزونز باي نيتشر، نريدكم أن تحبوا قطعكم الخشبية المصنوعة يدويًا بقدر ما نحبها نحن. نظرًا لأن كل قطعة فريدة ومصنوعة يدويًا، نطلب منكم مراجعة طلبكم بعناية عند الاستلام.</p>
            </section>

            <div className={styles.legalGrid}>
                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <ShieldAlert size={24} />
                        <h3>أهلية الإرجاع</h3>
                    </div>
                    <p>يمكنك إرجاع منتجك في غضون ١٤ يومًا من التسليم إذا:</p>
                    <ul>
                        <li>وصل المنتج تالفاً أو به عيب.</li>
                        <li>استلمت منتجاً خاطئاً.</li>
                    </ul>
                </div>

                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <Package size={24} />
                        <h3>منتجات غير قابلة للإرجاع</h3>
                    </div>
                    <p>نظرًا للطبيعة اليدوية لمنتجاتنا، لا يمكننا قبول المرتجعات لـ:</p>
                    <ul>
                        <li>تغيير الرأي (حيث يتم صنع كل قطعة حسب الطلب).</li>
                        <li>المنتجات التي تم استخدامها أو تعديلها أو تظهر عليها علامات التآكل.</li>
                    </ul>
                </div>

                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <Truck size={24} />
                        <h3>عملية الإرجاع</h3>
                    </div>
                    <ol>
                        <li><strong>اتصل بنا:</strong> راسلنا عبر البريد الإلكتروني info@seasonsbynature.com مع رقم طلبك وصورة للتلف أو العيب.</li>
                        <li><strong>الموافقة:</strong> إذا تمت الموافقة على إرجاعك، فسنقوم بالاتصال بك لتزويدك بالتعليمات حول كيفية إرجاع المنتج.</li>
                        <li><strong>الشحن:</strong> ستغطي سيزونز باي نيتشر تكاليف شحن الإرجاع للمنتجات التالفة أو الخاطئة.</li>
                    </ol>
                </div>

                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <CreditCard size={24} />
                        <h3>المبالغ المستردة</h3>
                    </div>
                    <p>بمجرد استلامنا لمرتجعك وفحصه، سنقوم بإخطارك بالموافقة على استرداد أموالك أو رفضه. في حالة الموافقة، ستتم معالجة استرداد أموالك تلقائيًا إلى طريقة الدفع الأصلية الخاصة بك في غضون ٥-١٠ أيام عمل.</p>
                </div>

                <div className={styles.legalSection}>
                    <div className={styles.sectionHeader}>
                        <RefreshCw size={24} />
                        <h3>الاستبدال</h3>
                    </div>
                    <p>إذا كنت بحاجة إلى منتج مختلف، يرجى تقديم طلب جديد للقطعة الصحيحة وإرجاع القطعة الأصلية باتباع العملية المذكورة أعلاه.</p>
                </div>
            </div>
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
