"use client";
import React, { useState, useEffect } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import { useLanguage } from '@/context/LanguageContext';
import styles from './Hero.module.css';

const slides = [
    {
        image: "/images/hero-banner.png",
        title: "CRAFTED BY NATURE\nSHAPED BY HAND",
        shopLink: "/shop?category=f9197132-1dc2-410b-a755-47b7bfaa1a5e"
    },
    {
        image: "/images/Banner-01.png",
        title: "ELEVATE YOUR HOME\nSUSTAINABLE BEAUTY",
        shopLink: "/shop?category=b8352ab0-c4e9-4e86-a3bc-66a391c9fbff"
    },
    {
        image: "/images/Banner-02.png",
        title: "TIMELESS DESIGN\nARTISAN TRADITION",
        shopLink: "/shop?category=df87c7e6-e8c4-4152-ba6d-f9d06beb9e4a"
    },
    {
        image: "/images/Banner-03.png",
        title: "SEASONS SPECIAL\nUNIQUE CREATIONS",
        shopLink: "/shop?category=bf9aa1db-f5b2-4599-99d9-abad59e6a0fa"
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
                            <Link href={slide.shopLink || "/shop"} className="hero-button-primary">
                                SHOP NOW
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
