"use client";

import React, { createContext, useContext, useState, useEffect } from 'react';

type Language = 'en' | 'ar';

interface LanguageContextType {
    language: Language;
    setLanguage: (lang: Language) => void;
    dir: 'ltr' | 'rtl';
    t: (key: string) => string;
}

const LanguageContext = createContext<LanguageContextType | undefined>(undefined);

const translations: Record<Language, Record<string, string>> = {
    en: {
        'nav.home': 'Home',
        'nav.shop': 'Shop',
        'nav.about': 'About',
        'nav.contact': 'Contact',
        'hero.title': 'Crafted by Nature,\nShaped by Hand',
        'hero.subtitle': 'Timeless wooden pieces for the modern home',
        'hero.cta': 'Shop Collection',
        'whatsapp.quick': 'WhatsApp Chat',
        'contact.title': 'Get in Touch',
        'contact.subtitle': 'We would love to hear from you. Reach out for inquiries, custom orders, or just to say hello.',
        'contact.form.name': 'Your Name',
        'contact.form.email': 'Email Address',
        'contact.form.subject': 'Subject',
        'contact.form.message': 'Message',
        'contact.form.send': 'Send Message',
        'contact.info.title': 'Contact Information',
        'contact.info.address': 'Cairo, Egypt (Artisan District)',
        'contact.info.phone': '+20 123 456 7890',
        'contact.info.email': 'hello@seasonsbynature.com',
        'contact.info.hours': 'Sat - Thu: 10am - 8pm',
        'contact.success': 'Thank you! Your message has been sent.',
    },
    ar: {
        'nav.home': 'الرئيسية',
        'nav.shop': 'المتجر',
        'nav.about': 'من نحن',
        'nav.contact': 'اتصل بنا',
        'hero.title': 'صُنع بيد الطبيعة،\nشُكّل بيد الإنسان',
        'hero.subtitle': 'قطع خشبية خالدة للمنزل المعاصر',
        'hero.cta': 'تسوق التشكيلة',
        'whatsapp.quick': 'دردشة واتساب',
        'contact.title': 'تواصل معنا',
        'contact.subtitle': 'يسعدنا سماع رأيك. تواصل معنا للاستفسارات أو الطلبات الخاصة أو لمجرد إلقاء التحية.',
        'contact.form.name': 'الاسم',
        'contact.form.email': 'البريد الإلكتروني',
        'contact.form.subject': 'الموضوع',
        'contact.form.message': 'الرسالة',
        'contact.form.send': 'إرسال الرسالة',
        'contact.info.title': 'معلومات الاتصال',
        'contact.info.address': 'القاهرة، مصر (حي الحرفيين)',
        'contact.info.phone': '+20 123 456 7890',
        'contact.info.email': 'hello@seasonsbynature.com',
        'contact.info.hours': 'السبت - الخميس: 10 صباحًا - 8 مساءً',
        'contact.success': 'شكرًا لك! تم إرسال رسالتك بنجاح.',
    }
};

export const LanguageProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    const [language, setLanguage] = useState<Language>('en');

    const dir = language === 'ar' ? 'rtl' : 'ltr';

    const t = (key: string) => {
        return translations[language][key] || key;
    };

    useEffect(() => {
        document.documentElement.dir = dir;
        document.documentElement.lang = language;
    }, [dir, language]);

    return (
        <LanguageContext.Provider value={{ language, setLanguage, dir, t }}>
            {children}
        </LanguageContext.Provider>
    );
};

export const useLanguage = () => {
    const context = useContext(LanguageContext);
    if (context === undefined) {
        throw new Error('useLanguage must be used within a LanguageProvider');
    }
    return context;
};
