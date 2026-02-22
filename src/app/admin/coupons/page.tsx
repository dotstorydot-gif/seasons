"use client";

import React, { useState, useEffect, useCallback } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import styles from './Coupons.module.css';
import { Plus, X, Loader2, Save, Trash2, Copy, Check } from 'lucide-react';
import { supabase } from '@/lib/supabase';
import { supabaseAdmin } from '@/lib/supabaseAdmin';

type DiscountType = 'percentage' | 'free_delivery';

const EMPTY_FORM = {
    code: '',
    discount_type: 'percentage' as DiscountType,
    discount_value: '',
    max_uses: '',          // blank = unlimited
    per_user_limit: '1',  // default: 1 per user
    expires_at: '',        // blank = no expiry
    is_active: true,
};

interface Coupon {
    id: string;
    code: string;
    discount_type: DiscountType;
    discount_value: number;
    max_uses: number | null;
    per_user_limit: number | null;
    expires_at: string | null;
    is_active: boolean;
    used_count?: number;
    coupon_usages?: { count: number }[];
}

export default function CouponsPage() {
    const [coupons, setCoupons] = useState<Coupon[]>([]);
    const [loading, setLoading] = useState(true);
    const [showForm, setShowForm] = useState(false);
    const [form, setForm] = useState({ ...EMPTY_FORM });
    const [saving, setSaving] = useState(false);
    const [copiedId, setCopiedId] = useState<string | null>(null);

    const fetchCoupons = useCallback(async () => {
        const { data } = await supabase
            .from('coupons')
            .select('*, coupon_usages(count)')
            .order('created_at', { ascending: false });
        if (data) {
            // Map usage count
            const mapped = data.map((c: Coupon) => ({
                ...c,
                used_count: c.coupon_usages?.[0]?.count || 0
            }));
            setCoupons(mapped);
        }
        setLoading(false);
    }, []);

    useEffect(() => {
        let isMounted = true;
        const fetch = async () => {
            const { data } = await supabase
                .from('coupons')
                .select('*, coupon_usages(count)')
                .order('created_at', { ascending: false });

            if (isMounted) {
                if (data) {
                    const mapped = data.map((c: Coupon) => ({
                        ...c,
                        used_count: c.coupon_usages?.[0]?.count || 0
                    }));
                    setCoupons(mapped);
                }
                setLoading(false);
            }
        };
        fetch();
        return () => { isMounted = false; };
    }, []);

    const generateCode = () => {
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        const code = Array.from({ length: 8 }, () => chars[Math.floor(Math.random() * chars.length)]).join('');
        setForm(f => ({ ...f, code }));
    };

    const handleSave = async () => {
        if (!form.code.trim()) return alert('Coupon code is required');
        setSaving(true);
        const payload = {
            code: form.code.trim().toUpperCase(),
            discount_type: form.discount_type,
            discount_value: form.discount_type === 'percentage' ? parseFloat(form.discount_value) || 0 : 0,
            max_uses: form.max_uses ? parseInt(form.max_uses) : null,
            per_user_limit: form.per_user_limit ? parseInt(form.per_user_limit) : null,
            expires_at: form.expires_at || null,
            is_active: form.is_active,
        };
        const { error } = await supabaseAdmin.from('coupons').insert([payload]);
        if (error) { alert('Error creating coupon: ' + error.message); setSaving(false); return; }
        setSaving(false);
        setShowForm(false);
        setForm({ ...EMPTY_FORM });
        fetchCoupons();
    };

    const toggleActive = async (id: string, current: boolean) => {
        await supabaseAdmin.from('coupons').update({ is_active: !current }).eq('id', id);
        fetchCoupons();
    };

    const deleteCoupon = async (id: string) => {
        if (!confirm('Delete this coupon?')) return;
        await supabaseAdmin.from('coupons').delete().eq('id', id);
        fetchCoupons();
    };

    const copyCode = (code: string, id: string) => {
        navigator.clipboard.writeText(code);
        setCopiedId(id);
        setTimeout(() => setCopiedId(null), 2000);
    };

    const isExpired = (exp: string | null) => exp ? new Date(exp) < new Date() : false;

    return (
        <AdminLayout>
            <div className={styles.page}>
                <header className={styles.header}>
                    <div>
                        <h1>Coupons</h1>
                        <p className={styles.sub}>{coupons.length} coupons total</p>
                    </div>
                    <button className={styles.addBtn} onClick={() => setShowForm(true)}>
                        <Plus size={16} /> New Coupon
                    </button>
                </header>

                {/* Coupons table */}
                <div className={styles.tableWrapper}>
                    {loading ? (
                        <div className={styles.loading}><Loader2 className={styles.spin} /> Loading...</div>
                    ) : coupons.length === 0 ? (
                        <div className={styles.empty}>No coupons yet. Create your first one!</div>
                    ) : (
                        <table className={styles.table}>
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Type</th>
                                    <th>Value</th>
                                    <th>Uses</th>
                                    <th>Per User</th>
                                    <th>Expires</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                {coupons.map(c => (
                                    <tr key={c.id} className={isExpired(c.expires_at) ? styles.expired : ''}>
                                        <td>
                                            <div className={styles.codeCell}>
                                                <code className={styles.code}>{c.code}</code>
                                                <button className={styles.copyBtn} onClick={() => copyCode(c.code, c.id)} title="Copy">
                                                    {copiedId === c.id ? <Check size={13} /> : <Copy size={13} />}
                                                </button>
                                            </div>
                                        </td>
                                        <td>
                                            <span className={`${styles.typeBadge} ${styles[c.discount_type]}`}>
                                                {c.discount_type === 'free_delivery' ? '🚚 Free Delivery' : `🏷️ ${c.discount_value}% Off`}
                                            </span>
                                        </td>
                                        <td>{c.discount_type === 'percentage' ? `${c.discount_value}%` : '—'}</td>
                                        <td>{c.used_count} / {c.max_uses ?? '∞'}</td>
                                        <td>{c.per_user_limit ?? '∞'}</td>
                                        <td>{c.expires_at ? new Date(c.expires_at).toLocaleDateString() : '∞'}</td>
                                        <td>
                                            <button
                                                className={`${styles.statusToggle} ${c.is_active && !isExpired(c.expires_at) ? styles.active : styles.inactive}`}
                                                onClick={() => toggleActive(c.id, c.is_active)}
                                            >
                                                {c.is_active && !isExpired(c.expires_at) ? 'Active' : isExpired(c.expires_at) ? 'Expired' : 'Paused'}
                                            </button>
                                        </td>
                                        <td>
                                            <button className={styles.deleteBtn} onClick={() => deleteCoupon(c.id)}><Trash2 size={15} /></button>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </div>

                {/* Create Coupon Modal */}
                {showForm && (
                    <div className={styles.overlay} onClick={() => setShowForm(false)}>
                        <div className={styles.modal} onClick={e => e.stopPropagation()}>
                            <div className={styles.modalHeader}>
                                <h2>New Coupon</h2>
                                <button onClick={() => setShowForm(false)}><X size={20} /></button>
                            </div>

                            <div className={styles.formGrid}>
                                {/* Code */}
                                <div className={styles.field}>
                                    <label>Coupon Code</label>
                                    <div className={styles.codeInput}>
                                        <input
                                            value={form.code}
                                            onChange={e => setForm(f => ({ ...f, code: e.target.value.toUpperCase() }))}
                                            placeholder="e.g. SUMMER20"
                                            className={styles.codeField}
                                        />
                                        <button type="button" onClick={generateCode} className={styles.generateBtn}>Generate</button>
                                    </div>
                                </div>

                                {/* Type */}
                                <div className={styles.field}>
                                    <label>Discount Type</label>
                                    <select value={form.discount_type} onChange={e => setForm(f => ({ ...f, discount_type: e.target.value as DiscountType }))}>
                                        <option value="percentage">Percentage Off</option>
                                        <option value="free_delivery">Free Delivery</option>
                                    </select>
                                </div>

                                {/* Value (only for percentage) */}
                                {form.discount_type === 'percentage' && (
                                    <div className={styles.field}>
                                        <label>Discount % (e.g. 15 = 15% off)</label>
                                        <input type="number" min="1" max="100" value={form.discount_value}
                                            onChange={e => setForm(f => ({ ...f, discount_value: e.target.value }))}
                                            placeholder="15"
                                        />
                                    </div>
                                )}

                                {/* Max total uses */}
                                <div className={styles.field}>
                                    <label>Max Total Uses (blank = unlimited)</label>
                                    <input type="number" min="1" value={form.max_uses}
                                        onChange={e => setForm(f => ({ ...f, max_uses: e.target.value }))}
                                        placeholder="e.g. 100"
                                    />
                                </div>

                                {/* Per user limit */}
                                <div className={styles.field}>
                                    <label>Max Uses Per User (blank = unlimited)</label>
                                    <input type="number" min="1" value={form.per_user_limit}
                                        onChange={e => setForm(f => ({ ...f, per_user_limit: e.target.value }))}
                                        placeholder="e.g. 1"
                                    />
                                </div>

                                {/* Expiry */}
                                <div className={styles.field}>
                                    <label>Expiry Date (optional)</label>
                                    <input type="datetime-local" value={form.expires_at}
                                        onChange={e => setForm(f => ({ ...f, expires_at: e.target.value }))}
                                    />
                                </div>

                                {/* Active toggle */}
                                <div className={styles.field}>
                                    <label>Active</label>
                                    <label className={styles.toggle}>
                                        <input type="checkbox" checked={form.is_active}
                                            onChange={e => setForm(f => ({ ...f, is_active: e.target.checked }))}
                                        />
                                        <span className={styles.slider} />
                                        <span>{form.is_active ? 'Yes — coupon is live' : 'No — coupon is paused'}</span>
                                    </label>
                                </div>
                            </div>

                            {/* Summary preview */}
                            <div className={styles.preview}>
                                <strong>Preview: </strong>
                                Code <code>{form.code || '???'}</code> →{' '}
                                {form.discount_type === 'free_delivery'
                                    ? 'Free delivery (saves 30 EGP)'
                                    : `${form.discount_value || 0}% off subtotal`}
                                {' · '}{form.max_uses ? `${form.max_uses} total uses` : 'Unlimited uses'}
                                {' · '}{form.per_user_limit ? `${form.per_user_limit}× per user` : 'Unlimited per user'}
                                {form.expires_at ? ` · Expires ${new Date(form.expires_at).toLocaleDateString()}` : ' · No expiry'}
                            </div>

                            <div className={styles.modalFooter}>
                                <button className={styles.cancelBtn} onClick={() => setShowForm(false)}>Cancel</button>
                                <button className={styles.saveBtn} onClick={handleSave} disabled={saving}>
                                    {saving ? <Loader2 size={15} className={styles.spin} /> : <Save size={15} />}
                                    {saving ? 'Creating...' : 'Create Coupon'}
                                </button>
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </AdminLayout>
    );
}
