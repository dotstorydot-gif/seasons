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
        'hero.title': 'Modern Organic Design',
        'hero.subtitle': 'Handcrafted furniture for slow living.',
        'hero.cta': 'Shop Collection',
        'whatsapp.quick': 'WhatsApp Chat',
    },
    ar: {
        'nav.home': 'الرئيسية',
        'nav.shop': 'المتجر',
        'nav.about': 'من نحن',
        'nav.contact': 'اتصل بنا',
        'hero.title': 'تصميم عضوي حديث',
        'hero.subtitle': 'أثاث مصنوع يدويًا لحياة هادئة.',
        'hero.cta': 'تسوق التشكيلة',
        'whatsapp.quick': 'دردشة واتساب',
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
