"use client";

import React, { useState } from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Contact.module.css';
import { Mail, Phone, MapPin, Clock, Send } from 'lucide-react';

export default function ContactPage() {
    const { t, dir } = useLanguage();
    const [submitted, setSubmitted] = useState(false);

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        setSubmitted(true);
        // In a real app, this would send the data to a backend or email service
    };

    return (
        <div className={styles.contactPage} dir={dir}>
            <div className={styles.container}>
                <header className={styles.header}>
                    <h1>{t('contact.title')}</h1>
                    <p>{t('contact.subtitle')}</p>
                </header>

                <div className={styles.layout}>
                    <div className={styles.formSection}>
                        {submitted ? (
                            <div className={styles.successMessage}>
                                {t('contact.success')}
                            </div>
                        ) : (
                            <form className={styles.contactForm} onSubmit={handleSubmit}>
                                <div className={styles.formGroup}>
                                    <label htmlFor="name">{t('contact.form.name')}</label>
                                    <input type="text" id="name" required />
                                </div>
                                <div className={styles.formGroup}>
                                    <label htmlFor="email">{t('contact.form.email')}</label>
                                    <input type="email" id="email" required />
                                </div>
                                <div className={styles.formGroup}>
                                    <label htmlFor="subject">{t('contact.form.subject')}</label>
                                    <input type="text" id="subject" required />
                                </div>
                                <div className={styles.formGroup}>
                                    <label htmlFor="message">{t('contact.form.message')}</label>
                                    <textarea id="message" required></textarea>
                                </div>
                                <button type="submit" className={styles.submitButton}>
                                    {t('contact.form.send')}
                                </button>
                            </form>
                        )}
                    </div>

                    <div className={styles.infoSection}>
                        <div className={styles.infoBlock}>
                            <h2>{t('contact.info.title')}</h2>
                            <div className={styles.infoItems}>
                                <div className={styles.infoItem}>
                                    <MapPin className={styles.infoIcon} size={24} />
                                    <div className={styles.infoText}>
                                        <h3>Address</h3>
                                        <p>{t('contact.info.address')}</p>
                                    </div>
                                </div>
                                <div className={styles.infoItem}>
                                    <Phone className={styles.infoIcon} size={24} />
                                    <div className={styles.infoText}>
                                        <h3>Phone</h3>
                                        <p>{t('contact.info.phone')}</p>
                                    </div>
                                </div>
                                <div className={styles.infoItem}>
                                    <Mail className={styles.infoIcon} size={24} />
                                    <div className={styles.infoText}>
                                        <h3>Email</h3>
                                        <p>{t('contact.info.email')}</p>
                                    </div>
                                </div>
                                <div className={styles.infoItem}>
                                    <Clock className={styles.infoIcon} size={24} />
                                    <div className={styles.infoText}>
                                        <h3>Hours</h3>
                                        <p>{t('contact.info.hours')}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}
