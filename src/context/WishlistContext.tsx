"use client";

import React, { createContext, useContext, useState, useEffect } from 'react';

export interface WishlistItem {
    id: string;
    nameEn: string;
    nameAr: string;
    price: number;
    image: string;
    sku?: string;
}

interface WishlistContextType {
    items: WishlistItem[];
    addItem: (product: WishlistItem) => void;
    removeItem: (id: string) => void;
    isWishlisted: (id: string) => boolean;
    toggle: (product: WishlistItem) => void;
    count: number;
}

const WishlistContext = createContext<WishlistContextType | undefined>(undefined);

export const WishlistProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    const [items, setItems] = useState<WishlistItem[]>(() => {
        if (typeof window === 'undefined') return [];
        try {
            const saved = localStorage.getItem('seasons-wishlist');
            return saved ? JSON.parse(saved) : [];
        } catch { return []; }
    });

    useEffect(() => {
        localStorage.setItem('seasons-wishlist', JSON.stringify(items));
    }, [items]);

    const addItem = (product: WishlistItem) => {
        setItems(prev => prev.find(i => i.id === product.id) ? prev : [...prev, product]);
    };

    const removeItem = (id: string) => {
        setItems(prev => prev.filter(i => i.id !== id));
    };

    const isWishlisted = (id: string) => items.some(i => i.id === id);

    const toggle = (product: WishlistItem) => {
        if (isWishlisted(product.id)) {
            removeItem(product.id);
        } else {
            addItem(product);
        }
    };

    return (
        <WishlistContext.Provider value={{ items, addItem, removeItem, isWishlisted, toggle, count: items.length }}>
            {children}
        </WishlistContext.Provider>
    );
};

export const useWishlist = () => {
    const ctx = useContext(WishlistContext);
    if (!ctx) throw new Error('useWishlist must be used within WishlistProvider');
    return ctx;
};
