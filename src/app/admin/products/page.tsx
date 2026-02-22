"use client";

import React, { useState, useEffect, useCallback } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import styles from './AdminProducts.module.css';
import { Search, Plus, Edit, Trash2, Loader2, X, Save, Image as ImageIcon } from 'lucide-react';
import { supabase } from '@/lib/supabase';

const EMPTY_FORM = {
    name_en: '', name_ar: '', description_en: '', description_ar: '',
    price: '', sku: '', stock: '', is_featured: false, category_id: '',
    images: [] as string[],
};

export default function AdminProductsPage() {
    const [products, setProducts] = useState<any[]>([]);
    const [categories, setCategories] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [search, setSearch] = useState('');
    const [editProduct, setEditProduct] = useState<any | null>(null);
    const [form, setForm] = useState({ ...EMPTY_FORM });
    const [saving, setSaving] = useState(false);
    const [newImageUrl, setNewImageUrl] = useState('');

    const fetchData = useCallback(async () => {
        setLoading(true);
        const [{ data: products }, { data: cats }] = await Promise.all([
            supabase.from('products').select('*, categories(name_en)').order('created_at', { ascending: false }),
            supabase.from('categories').select('id, name_en').order('sort_order')
        ]);
        if (products) setProducts(products);
        if (cats) setCategories(cats);
        setLoading(false);
    }, []);

    useEffect(() => { fetchData(); }, [fetchData]);

    const openEdit = (product: any) => {
        setEditProduct(product);
        setForm({
            name_en: product.name_en || '',
            name_ar: product.name_ar || '',
            description_en: product.description_en || '',
            description_ar: product.description_ar || '',
            price: product.price?.toString() || '',
            sku: product.sku || '',
            stock: product.stock?.toString() || '',
            is_featured: product.is_featured || false,
            category_id: product.category_id || '',
            images: product.images || [],
        });
    };

    const openNew = () => {
        setEditProduct({});
        setForm({ ...EMPTY_FORM });
    };

    const handleSave = async () => {
        setSaving(true);
        const payload = {
            name_en: form.name_en, name_ar: form.name_ar,
            description_en: form.description_en, description_ar: form.description_ar,
            price: parseFloat(form.price) || 0,
            sku: form.sku,
            stock: parseInt(form.stock) || 0,
            is_featured: form.is_featured,
            category_id: form.category_id || null,
            images: form.images,
        };

        if (editProduct?.id) {
            await supabase.from('products').update(payload).eq('id', editProduct.id);
        } else {
            await supabase.from('products').insert([payload]);
        }
        setSaving(false);
        setEditProduct(null);
        fetchData();
    };

    const handleDelete = async (id: string) => {
        if (!confirm('Delete this product?')) return;
        await supabase.from('products').delete().eq('id', id);
        fetchData();
    };

    const addImageUrl = () => {
        if (newImageUrl.trim()) {
            setForm(f => ({ ...f, images: [...f.images, newImageUrl.trim()] }));
            setNewImageUrl('');
        }
    };

    const removeImage = (idx: number) => {
        setForm(f => ({ ...f, images: f.images.filter((_, i) => i !== idx) }));
    };

    const filtered = products.filter(p =>
        p.name_en?.toLowerCase().includes(search.toLowerCase()) ||
        p.sku?.toLowerCase().includes(search.toLowerCase())
    );

    return (
        <AdminLayout>
            <div className={styles.products}>
                <header className={styles.header}>
                    <div>
                        <h1>Product Management</h1>
                        <p className={styles.subheader}>{products.length} products</p>
                    </div>
                    <button className={styles.addBtn} onClick={openNew}><Plus size={16} /> Add Product</button>
                </header>

                <div className={styles.toolbar}>
                    <div className={styles.search}>
                        <Search size={16} />
                        <input type="text" placeholder="Search by name or SKU..." value={search} onChange={e => setSearch(e.target.value)} />
                    </div>
                </div>

                <div className={styles.tableWrapper}>
                    {loading ? (
                        <div className={styles.loading}><Loader2 className={styles.spinner} /></div>
                    ) : (
                        <table className={styles.table}>
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>SKU</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th>Featured</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                {filtered.map(product => (
                                    <tr key={product.id}>
                                        <td>
                                            {product.images?.[0]
                                                ? <img src={product.images[0]} alt="" className={styles.thumb} />
                                                : <div className={styles.thumbPlaceholder}><ImageIcon size={16} /></div>
                                            }
                                        </td>
                                        <td><code>{product.sku}</code></td>
                                        <td><strong>{product.name_en}</strong><br /><small>{product.name_ar}</small></td>
                                        <td>{product.categories?.name_en || '—'}</td>
                                        <td>{product.price} EGP</td>
                                        <td>
                                            <span className={product.stock > 5 ? styles.inStock : styles.lowStock}>
                                                {product.stock}
                                            </span>
                                        </td>
                                        <td>{product.is_featured ? '⭐' : '—'}</td>
                                        <td>
                                            <div className={styles.actions}>
                                                <button className={styles.iconBtn} onClick={() => openEdit(product)} title="Edit"><Edit size={15} /></button>
                                                <button className={`${styles.iconBtn} ${styles.delete}`} onClick={() => handleDelete(product.id)} title="Delete"><Trash2 size={15} /></button>
                                            </div>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </div>

                {/* Edit / New Modal */}
                {editProduct !== null && (
                    <div className={styles.modalOverlay} onClick={() => setEditProduct(null)}>
                        <div className={styles.modal} onClick={e => e.stopPropagation()}>
                            <div className={styles.modalHeader}>
                                <h2>{editProduct?.id ? 'Edit Product' : 'New Product'}</h2>
                                <button className={styles.closeBtn} onClick={() => setEditProduct(null)}><X size={20} /></button>
                            </div>

                            <div className={styles.formGrid}>
                                {/* EN Name */}
                                <div className={styles.formGroup}>
                                    <label>Name (EN)</label>
                                    <input value={form.name_en} onChange={e => setForm(f => ({ ...f, name_en: e.target.value }))} placeholder="e.g. Star Plate" />
                                </div>
                                <div className={styles.formGroup}>
                                    <label>Name (AR)</label>
                                    <input value={form.name_ar} onChange={e => setForm(f => ({ ...f, name_ar: e.target.value }))} dir="rtl" placeholder="طبق نجمة" />
                                </div>

                                {/* Description */}
                                <div className={`${styles.formGroup} ${styles.fullWidth}`}>
                                    <label>Description (EN)</label>
                                    <textarea value={form.description_en} onChange={e => setForm(f => ({ ...f, description_en: e.target.value }))} rows={3} />
                                </div>
                                <div className={`${styles.formGroup} ${styles.fullWidth}`}>
                                    <label>Description (AR)</label>
                                    <textarea value={form.description_ar} onChange={e => setForm(f => ({ ...f, description_ar: e.target.value }))} rows={3} dir="rtl" />
                                </div>

                                {/* SKU, Price, Stock */}
                                <div className={styles.formGroup}>
                                    <label>SKU</label>
                                    <input value={form.sku} onChange={e => setForm(f => ({ ...f, sku: e.target.value }))} placeholder="037" />
                                </div>
                                <div className={styles.formGroup}>
                                    <label>Price (EGP)</label>
                                    <input type="number" value={form.price} onChange={e => setForm(f => ({ ...f, price: e.target.value }))} placeholder="610" />
                                </div>
                                <div className={styles.formGroup}>
                                    <label>Stock</label>
                                    <input type="number" value={form.stock} onChange={e => setForm(f => ({ ...f, stock: e.target.value }))} placeholder="50" />
                                </div>

                                {/* Category */}
                                <div className={styles.formGroup}>
                                    <label>Category</label>
                                    <select value={form.category_id} onChange={e => setForm(f => ({ ...f, category_id: e.target.value }))}>
                                        <option value="">— Select —</option>
                                        {categories.map(c => <option key={c.id} value={c.id}>{c.name_en}</option>)}
                                    </select>
                                </div>

                                {/* Featured */}
                                <div className={styles.formGroup}>
                                    <label>Featured</label>
                                    <label className={styles.toggle}>
                                        <input type="checkbox" checked={form.is_featured} onChange={e => setForm(f => ({ ...f, is_featured: e.target.checked }))} />
                                        <span className={styles.toggleSlider} />
                                        {form.is_featured ? 'Yes' : 'No'}
                                    </label>
                                </div>

                                {/* Images */}
                                <div className={`${styles.formGroup} ${styles.fullWidth}`}>
                                    <label>Images (URLs in order — first is main, second is hover)</label>
                                    <div className={styles.imageList}>
                                        {form.images.map((url, i) => (
                                            <div key={i} className={styles.imageRow}>
                                                <img src={url} alt="" className={styles.imageThumb} />
                                                <span className={styles.imageUrl}>{url}</span>
                                                <span className={styles.imageLabel}>{i === 0 ? 'Main' : i === 1 ? 'Hover' : `#${i + 1}`}</span>
                                                <button onClick={() => removeImage(i)} className={styles.removeImg}><X size={14} /></button>
                                            </div>
                                        ))}
                                    </div>
                                    <div className={styles.addImageRow}>
                                        <input
                                            value={newImageUrl}
                                            onChange={e => setNewImageUrl(e.target.value)}
                                            placeholder="Paste image URL and press Add..."
                                            onKeyDown={e => e.key === 'Enter' && addImageUrl()}
                                        />
                                        <button onClick={addImageUrl} className={styles.addImgBtn}>Add</button>
                                    </div>
                                </div>
                            </div>

                            <div className={styles.modalFooter}>
                                <button className={styles.cancelBtn} onClick={() => setEditProduct(null)}>Cancel</button>
                                <button className={styles.saveBtn} onClick={handleSave} disabled={saving}>
                                    {saving ? <Loader2 size={16} className={styles.spin} /> : <Save size={16} />}
                                    {saving ? 'Saving...' : 'Save Product'}
                                </button>
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </AdminLayout>
    );
}
