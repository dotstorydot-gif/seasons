"use client";

import React, { Suspense } from 'react';
import { useSearchParams } from 'next/navigation';
import Link from 'next/link';
import { CheckCircle, ArrowRight } from 'lucide-react';
import styles from './ThankYou.module.css';

function ThankYouContent() {
    const searchParams = useSearchParams();
    const orderNumber = searchParams.get('order');

    return (
        <div className={styles.thankYouPage}>
            <div className={styles.container}>
                <div className={styles.card}>
                    <CheckCircle className={styles.icon} size={64} />
                    <h1 className={styles.title}>Thank You For Your Order</h1>
                    <p className={styles.subtitle}>
                        Your order has been placed successfully. We&apos;ll send you a confirmation email shortly.
                    </p>

                    <div className={styles.orderBox}>
                        <span>Order Number:</span>
                        <strong>{orderNumber || 'N/A'}</strong>
                    </div>

                    <div className={styles.actions}>
                        <Link href="/shop" className="premium-button">
                            Continue Shopping
                        </Link>
                        <Link href="/" className={styles.homeLink}>
                            Return Home <ArrowRight size={16} />
                        </Link>
                    </div>
                </div>

                <div className={styles.support}>
                    <p>Need help with your order? <Link href="/contact">Contact Support</Link></p>
                </div>
            </div>
        </div>
    );
}

export default function ThankYouPage() {
    return (
        <Suspense fallback={<div>Loading...</div>}>
            <ThankYouContent />
        </Suspense>
    );
}
