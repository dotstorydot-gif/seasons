"use client";

import React, { useRef } from 'react';
import { createContext, useContext, useState } from 'react';
import styles from './Toast.module.css';
import { ShoppingBag, Heart, X } from 'lucide-react';

interface Toast {
    id: number;
    message: string;
    type: 'cart' | 'wishlist';
}

interface ToastContextType {
    showToast: (message: string, type?: 'cart' | 'wishlist') => void;
}

const ToastContext = createContext<ToastContextType | undefined>(undefined);

export const ToastProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    const [toasts, setToasts] = useState<Toast[]>([]);
    const counterRef = useRef(0);

    const showToast = (message: string, type: 'cart' | 'wishlist' = 'cart') => {
        const id = ++counterRef.current;
        setToasts(prev => [...prev, { id, message, type }]);
        setTimeout(() => {
            setToasts(prev => prev.filter(t => t.id !== id));
        }, 3000);
    };

    const dismiss = (id: number) => setToasts(prev => prev.filter(t => t.id !== id));

    return (
        <ToastContext.Provider value={{ showToast }}>
            {children}
            <div className={styles.toastContainer}>
                {toasts.map(toast => (
                    <div key={toast.id} className={`${styles.toast} ${styles[toast.type]}`}>
                        {toast.type === 'cart' ? <ShoppingBag size={16} /> : <Heart size={16} />}
                        <span>{toast.message}</span>
                        <button onClick={() => dismiss(toast.id)} className={styles.closeBtn}>
                            <X size={14} />
                        </button>
                    </div>
                ))}
            </div>
        </ToastContext.Provider>
    );
};

export const useToast = () => {
    const ctx = useContext(ToastContext);
    if (!ctx) throw new Error('useToast must be used within ToastProvider');
    return ctx;
};
