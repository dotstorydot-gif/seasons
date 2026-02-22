"use client";

import React, { useState, useEffect } from 'react';
import { X } from 'lucide-react';
import styles from './EmailPopup.module.css';

const EmailPopup = () => {
    const [isVisible, setIsVisible] = useState(false);

    useEffect(() => {
        const timer = setTimeout(() => {
            const hasSeen = localStorage.getItem('hasSeenPopup');
            if (!hasSeen) {
                setIsVisible(true);
            }
        }, 5000); // Show after 5 seconds
        return () => clearTimeout(timer);
    }, []);

    const closePopup = () => {
        setIsVisible(false);
        localStorage.setItem('hasSeenPopup', 'true');
    };

    if (!isVisible) return null;

    return (
        <div className={styles.overlay}>
            <div className={styles.popup}>
                <button onClick={closePopup} className={styles.close}><X size={20} /></button>
                <div className={styles.content}>
                    <span className={styles.tag}>Stay Inspired</span>
                    <h2>Join the SEASONS slow living movement.</h2>
                    <p>Subscribe to receive curated interior inspiration and exclusive early access to new collections.</p>
                    <form className={styles.form} onSubmit={(e) => { e.preventDefault(); closePopup(); }}>
                        <input type="email" placeholder="Your email address" required />
                        <button type="submit" className="premium-button">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    );
};

export default EmailPopup;
