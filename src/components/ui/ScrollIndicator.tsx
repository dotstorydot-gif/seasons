"use client";

import React, { useEffect, useState, RefObject } from 'react';
import styles from './ScrollIndicator.module.css';

interface ScrollIndicatorProps {
    containerRef: RefObject<HTMLDivElement | null>;
}

const ScrollIndicator = ({ containerRef }: ScrollIndicatorProps) => {
    const [activeIndex, setActiveIndex] = useState(0);
    const [dotCount, setDotCount] = useState(0);
    const [isVisible, setIsVisible] = useState(false);

    useEffect(() => {
        const container = containerRef.current;
        if (!container) return;

        const calculateDots = () => {
            const { scrollWidth, clientWidth } = container;
            if (scrollWidth <= clientWidth) {
                setIsVisible(false);
                return;
            }
            setIsVisible(true);

            // Number of children is a good proxy for dots in our snapped sliders
            const count = container.children.length;
            setDotCount(count);
        };

        const updateActiveDot = () => {
            const { scrollLeft, scrollWidth, clientWidth } = container;
            const count = container.children.length;
            if (count === 0) return;

            const scrollPercentage = scrollLeft / (scrollWidth - clientWidth);
            const index = Math.round(scrollPercentage * (count - 1));
            setActiveIndex(index);
        };

        calculateDots();
        updateActiveDot();

        container.addEventListener('scroll', updateActiveDot);
        window.addEventListener('resize', calculateDots);

        return () => {
            container.removeEventListener('scroll', updateActiveDot);
            window.removeEventListener('resize', calculateDots);
        };
    }, [containerRef]);

    if (!isVisible || dotCount <= 1) return null;

    return (
        <div className={styles.wrapper}>
            <div className={styles.dotsContainer}>
                {Array.from({ length: dotCount }).map((_, i) => (
                    <div
                        key={i}
                        className={`${styles.dot} ${i === activeIndex ? styles.active : ''}`}
                    />
                ))}
            </div>
        </div>
    );
};

export default ScrollIndicator;
