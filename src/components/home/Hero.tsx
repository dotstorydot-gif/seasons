"use client";
import React, { useState, useEffect } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Hero.module.css';

const slides = [
    {
        image: "/images/hero-banner.png",
        title: "CRAFTED BY NATURE\nSHAPED BY HAND"
    },
    {
        image: "/images/Photos/Rectangle Plate 1.png",
        title: "TIMELESS DESIGN\nARTISAN TRADITION"
    },
    {
        image: "/images/Photos/Tray with black handle.png",
        title: "ELEVATE YOUR HOME\nSUSTAINABLE BEAUTY"
    }
];

const Hero = () => {
    const { dir } = useLanguage();
    const [currentSlide, setCurrentSlide] = useState(0);

    useEffect(() => {
        const timer = setInterval(() => {
            setCurrentSlide((prev) => (prev + 1) % slides.length);
        }, 5000);
        return () => clearInterval(timer);
    }, []);

    return (
        <section className={styles.hero} dir={dir}>
            {slides.map((slide, index) => (
                <div
                    key={index}
                    className={`${styles.slide} ${index === currentSlide ? styles.active : ''}`}
                >
                    <Image
                        src={slide.image}
                        alt={`Seasons Slide ${index + 1}`}
                        fill
                        priority={index === 0}
                        className={styles.heroImage}
                        style={{ objectFit: 'cover' }}
                    />
                    <div className={styles.overlay}></div>
                    <div className={styles.content}>
                        <h1 className={styles.title}>
                            {slide.title.split('\n').map((line, i) => (
                                <React.Fragment key={i}>
                                    {line}
                                    {i === 0 && <br />}
                                </React.Fragment>
                            ))}
                        </h1>
                        <div className={styles.actions}>
                            <Link href="/shop" className="hero-button-primary">
                                SHOP COLLECTION
                            </Link>
                            <Link href="/about" className="hero-button-ghost">
                                ABOUT
                            </Link>
                        </div>
                    </div>
                </div>
            ))}

            <div className={styles.indicators}>
                {slides.map((_, index) => (
                    <button
                        key={index}
                        className={`${styles.dot} ${index === currentSlide ? styles.dotActive : ''}`}
                        onClick={() => setCurrentSlide(index)}
                        aria-label={`Go to slide ${index + 1}`}
                    />
                ))}
            </div>
        </section>
    );
};

export default Hero;
