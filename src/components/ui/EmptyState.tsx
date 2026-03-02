import React from 'react';
import Link from 'next/link';
import styles from './EmptyState.module.css';
import { LucideIcon } from 'lucide-react';

interface EmptyStateProps {
    icon: LucideIcon;
    title: string;
    description: string;
    actionLabel: string;
    actionHref: string;
}

const EmptyState = ({ icon: Icon, title, description, actionLabel, actionHref }: EmptyStateProps) => {
    return (
        <div className={styles.emptyState}>
            <div className={styles.iconWrapper}>
                <Icon size={48} strokeWidth={1} className={styles.icon} />
            </div>
            <h2 className={styles.title}>{title}</h2>
            <p className={styles.description}>{description}</p>
            <Link href={actionHref} className="premium-button">
                {actionLabel}
            </Link>
        </div>
    );
};

export default EmptyState;
