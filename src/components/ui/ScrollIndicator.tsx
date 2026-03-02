"use client";

import React, { useEffect, useState, RefObject } from 'react';
import styles from './ScrollIndicator.module.css';

interface ScrollIndicatorProps {
    containerRef: RefObject<HTMLDivElement | null>;
}

const ScrollIndicator = ({ containerRef }: ScrollIndicatorProps) => {
    const [progress, setProgress] = useState(0);
    const [isVisible, setIsVisible] = useState(false);

    useEffect(() => {
        const container = containerRef.current;
        if (!container) return;

        const updateProgress = () => {
            const { scrollLeft, scrollWidth, clientWidth } = container;
            const maxScroll = scrollWidth - clientWidth;
            if (maxScroll <= 0) {
                setIsVisible(false);
                return;
            }
            setIsVisible(true);
            const currentProgress = (scrollLeft / maxScroll) * 100;
            setProgress(currentProgress);
        };

        // Check visibility on mount/resize
        updateProgress();

        container.addEventListener('scroll', updateProgress);
        window.addEventListener('resize', updateProgress);

        return () => {
            container.removeEventListener('scroll', updateProgress);
            window.removeEventListener('resize', updateProgress);
        };
    }, [containerRef]);

    if (!isVisible) return null;

    return (
        <div className={styles.wrapper}>
            <div className={styles.track}>
                <div
                    className={styles.bar}
                    style={{ width: `${Math.max(10, progress)}%`, left: `${progress * 0.9}%` }}
                />
            </div>
        </div>
    );
};

export default ScrollIndicator;
