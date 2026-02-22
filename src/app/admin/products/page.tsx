"use client";

import React from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import styles from './AdminProducts.module.css';
import { Search, Plus, Edit, Trash2 } from 'lucide-react';

const DUMMY_PRODUCTS = [
    { id: '1', sku: 'SL-001', name: 'Serene Lounge Chair', category: 'Seating', price: 4500, stock: 12 },
    { id: '2', sku: 'CT-012', name: 'Oak Coffee Table', category: 'Tables', price: 3200, stock: 8 },
    { id: '3', sku: 'FL-005', name: 'Minimalist Floor Lamp', category: 'Lighting', price: 1800, stock: 24 },
];

export default function AdminProductsPage() {
    return (
        <AdminLayout>
            <div className={styles.products}>
                <header className={styles.header}>
                    <h1>Product Management</h1>
                    <button className={styles.addBtn}><Plus size={18} /> Add New Product</button>
                </header>

                <div className={styles.toolbar}>
                    <div className={styles.search}>
                        <Search size={18} />
                        <input type="text" placeholder="Search by name, category or SKU..." />
                    </div>
                </div>

                <div className={styles.tableWrapper}>
                    <table className={styles.table}>
                        <thead>
                            <tr>
                                <th>SKU</th>
                                <th>Product Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Stock</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            {DUMMY_PRODUCTS.map(product => (
                                <tr key={product.id}>
                                    <td><code>{product.sku}</code></td>
                                    <td><strong>{product.name}</strong></td>
                                    <td>{product.category}</td>
                                    <td>{product.price} EGP</td>
                                    <td>{product.stock > 10 ? <span className={styles.inStock}>{product.stock} in stock</span> : <span className={styles.lowStock}>{product.stock} low stock</span>}</td>
                                    <td>
                                        <div className={styles.actions}>
                                            <button className={styles.iconBtn}><Edit size={16} /></button>
                                            <button className={`${styles.iconBtn} ${styles.delete}`}><Trash2 size={16} /></button>
                                        </div>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </AdminLayout>
    );
}
