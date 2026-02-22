"use client";

import React from 'react';
import { MessageCircle } from 'lucide-react';
import styles from './WhatsAppButton.module.css';
import { useLanguage } from '@/context/LanguageContext';

const WhatsAppButton = () => {
    const { t } = useLanguage();
    const phoneNumber = '201234567890'; // Placeholder Egyptian number
    const message = 'Hello! I would like to inquire about your products.';
    const whatsappUrl = `https://wa.me/${phoneNumber}?text=${encodeURIComponent(message)}`;

    return (
        <a
            href={whatsappUrl}
            target="_blank"
            rel="noopener noreferrer"
            className={styles.button}
            aria-label="Contact on WhatsApp"
        >
            <MessageCircle size={24} />
            <span className={styles.tooltip}>{t('whatsapp.quick')}</span>
        </a>
    );
};

export default WhatsAppButton;
