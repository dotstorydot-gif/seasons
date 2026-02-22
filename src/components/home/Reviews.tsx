"use client";

import React from 'react';
import styles from './Reviews.module.css';
import { Star } from 'lucide-react';

const REVIEWS = [
    {
        id: '1',
        author: 'Sarah J.',
        text: 'The quality of the wooden furniture is exceptional. It fits perfectly in my minimalist living room.',
        rating: 5
    },
    {
        id: '2',
        author: 'Ahmed M.',
        text: 'Excellent customer service and fast delivery. The pieces are even more beautiful in person.',
        rating: 5
    },
    {
        id: '3',
        author: 'Elena R.',
        text: 'A truly premium experience. The organic aesthetic is exactly what I was looking for.',
        rating: 4
    }
];

const Reviews = () => {
    return (
        <section className={styles.reviews}>
            <div className={styles.container}>
                <div className={styles.header}>
                    <h2 className={styles.title}>What Our Customers Say</h2>
                </div>
                <div className={styles.grid}>
                    {REVIEWS.map(review => (
                        <div key={review.id} className={styles.reviewCard}>
                            <div className={styles.stars}>
                                {[...Array(review.rating)].map((_, i) => (
                                    <Star key={i} size={16} fill="var(--accent-gold)" color="var(--accent-gold)" />
                                ))}
                            </div>
                            <p className={styles.text}>"{review.text}"</p>
                            <span className={styles.author}>— {review.author}</span>
                        </div>
                    ))}
                </div>
            </div>
        </section>
    );
};

export default Reviews;
