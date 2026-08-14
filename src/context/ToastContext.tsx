"use client";

import React, { useRef, useEffect, useCallback, createContext, useContext, useState } from 'react';
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
    const timeoutsRef = useRef<Map<number, NodeJS.Timeout>>(new Map());

    useEffect(() => {
        const currentTimers = timeoutsRef.current;
        return () => {
            currentTimers.forEach(timer => clearTimeout(timer));
            currentTimers.clear();
        };
    }, []);

    const dismiss = useCallback((id: number) => {
        setToasts(prev => prev.filter(t => t.id !== id));
        if (timeoutsRef.current.has(id)) {
            clearTimeout(timeoutsRef.current.get(id));
            timeoutsRef.current.delete(id);
        }
    }, []);

    const showToast = useCallback((message: string, type: 'cart' | 'wishlist' = 'cart') => {
        const id = ++counterRef.current;
        setToasts(prev => [...prev, { id, message, type }]);
        const timer = setTimeout(() => {
            dismiss(id);
        }, 3000);
        timeoutsRef.current.set(id, timer);
    }, [dismiss]);

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
