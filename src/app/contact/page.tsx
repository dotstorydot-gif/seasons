"use client";

import React, { useState } from 'react';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Contact.module.css';
import { Mail, Phone, MapPin } from 'lucide-react';

export default function ContactPage() {
    const { t, dir, language } = useLanguage();
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
                            <h2>Contact Information</h2>
                            <div className={styles.infoItems}>
                                <div className={styles.infoItem}>
                                    <Phone className={styles.infoIcon} size={24} />
                                    <div className={styles.infoText}>
                                        <h3>WhatsApp</h3>
                                        <p>+20 113 037 3971</p>
                                    </div>
                                </div>
                                <div className={styles.infoItem}>
                                    <Mail className={styles.infoIcon} size={24} />
                                    <div className={styles.infoText}>
                                        <h3>Email</h3>
                                        <p>info@seasonsbynature.com</p>
                                    </div>
                                </div>
                                <div className={styles.infoItem}>
                                    <div className={styles.socialInfo}>
                                        <h3>Follow Us</h3>
                                        <div className={styles.socialLinks}>
                                            <a href="https://www.instagram.com/seasonsbynature/" target="_blank" rel="noopener noreferrer" className={styles.socialIcon}>
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><rect x="2" y="2" width="20" height="20" rx="5" ry="5" /><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" /><line x1="17.5" y1="6.5" x2="17.51" y2="6.5" /></svg>
                                            </a>
                                            <a href="https://www.facebook.com/seasonsbynature" target="_blank" rel="noopener noreferrer" className={styles.socialIcon}>
                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z" /></svg>
                                            </a>
                                        </div>
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
