"use client";

import React, { createContext, useContext, useState, useEffect } from 'react';

export interface CartItem {
    id: string;
    nameEn: string;
    nameAr: string;
    price: number;
    image: string;
    quantity: number;
    sku?: string;
}

export interface Product {
    id: string;
    nameEn?: string;
    nameAr?: string;
    name_en?: string;
    name_ar?: string;
    price: number;
    image?: string;
    image_url?: string;
    images?: string[];
    sku?: string;
    category_id?: string;
}

interface CartContextType {
    items: CartItem[];
    addItem: (product: Product, quantity?: number) => void;
    removeItem: (id: string) => void;
    updateQuantity: (id: string, quantity: number) => void;
    clearCart: () => void;
    total: number;
    itemCount: number;
    orderNote: string;
    setOrderNote: (note: string) => void;
}

const CartContext = createContext<CartContextType | undefined>(undefined);

export const CartProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    const [items, setItems] = useState<CartItem[]>([]);
    const [orderNote, setOrderNote] = useState('');

    // Use a flag to prevent server/client mismatch if SSR is used
    const [isInitialized, setIsInitialized] = useState(false);

    // Load cart from localStorage on mount
    useEffect(() => {
        // Defer to next tick to avoid cascading renders warning
        Promise.resolve().then(() => {
            const savedCart = localStorage.getItem('seasons-cart');
            if (savedCart) {
                try {
                    const parsed = JSON.parse(savedCart);
                    setItems(parsed);
                } catch (e) {
                    console.error('Failed to parse saved cart:', e);
                }
            }

            const savedNote = localStorage.getItem('seasons-order-note');
            if (savedNote) setOrderNote(savedNote);

            setIsInitialized(true);
        });
    }, []);

    // Save cart to localStorage on changes (only after initialization)
    useEffect(() => {
        if (isInitialized) {
            localStorage.setItem('seasons-cart', JSON.stringify(items));
        }
    }, [items, isInitialized]);

    useEffect(() => {
        if (isInitialized) {
            localStorage.setItem('seasons-order-note', orderNote);
        }
    }, [orderNote, isInitialized]);

    const addItem = (product: Product, quantity: number = 1) => {
        setItems(prev => {
            const existingItem = prev.find(item => item.id === product.id);
            if (existingItem) {
                return prev.map(item =>
                    item.id === product.id
                        ? { ...item, quantity: item.quantity + quantity }
                        : item
                );
            }
            return [...prev, {
                id: product.id,
                nameEn: (product.nameEn || product.name_en || '') as string,
                nameAr: (product.nameAr || product.name_ar || '') as string,
                price: product.price,
                image: (product.images?.[0] || product.image || product.image_url || '') as string,
                sku: product.sku || '',
                quantity
            }];
        });
    };

    const removeItem = (id: string) => {
        setItems(prev => prev.filter(item => item.id !== id));
    };

    const updateQuantity = (id: string, quantity: number) => {
        if (quantity < 1) return;
        setItems(prev => prev.map(item =>
            item.id === id ? { ...item, quantity } : item
        ));
    };

    const clearCart = () => {
        setItems([]);
        setOrderNote('');
    };

    const total = items.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    const itemCount = items.reduce((sum, item) => sum + item.quantity, 0);

    return (
        <CartContext.Provider value={{ items, addItem, removeItem, updateQuantity, clearCart, total, itemCount, orderNote, setOrderNote }}>
            {children}
        </CartContext.Provider>
    );
};

export const useCart = () => {
    const context = useContext(CartContext);
    if (context === undefined) {
        throw new Error('useCart must be used within a CartProvider');
    }
    return context;
};
