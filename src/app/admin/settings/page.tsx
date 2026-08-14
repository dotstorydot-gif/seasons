"use client";

import React, { useState, useEffect } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import { Save, Loader2, Globe, Mail, Phone, Truck, ShieldAlert } from 'lucide-react';
import { adminHeaders } from '@/lib/adminHeaders';
import { useToast } from '@/context/ToastContext';

export default function SettingsPage() {
    const { showToast } = useToast();
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [settings, setSettings] = useState({
        store_name: 'Seasons',
        contact_email: 'contact@seasons.com',
        whatsapp_number: '+201234567890',
        shipping_fee: '75',
        free_shipping_threshold: '0',
        currency: 'EGP',
        tax_percentage: '0'
    });

    useEffect(() => {
        const fetchSettings = async () => {
            setLoading(true);
            try {
                const res = await fetch('/api/settings');
                if (res.ok) {
                    const data = await res.json();
                    setSettings({
                        store_name: data.store_name || 'Seasons',
                        contact_email: data.contact_email || 'contact@seasons.com',
                        whatsapp_number: data.whatsapp_number || '+201234567890',
                        shipping_fee: (data.shipping_fee ?? 75).toString(),
                        free_shipping_threshold: (data.free_shipping_threshold ?? 0).toString(),
                        currency: data.currency || 'EGP',
                        tax_percentage: (data.tax_percentage ?? 0).toString()
                    });
                }
            } catch (err) {
                console.error('Failed to load settings:', err);
            } finally {
                setLoading(false);
            }
        };
        fetchSettings();
    }, []);

    const handleSave = async () => {
        setSaving(true);
        const payload = {
            store_name: settings.store_name.trim(),
            contact_email: settings.contact_email.trim(),
            whatsapp_number: settings.whatsapp_number.trim(),
            shipping_fee: parseFloat(settings.shipping_fee) || 0,
            free_shipping_threshold: parseFloat(settings.free_shipping_threshold) || 0,
            currency: settings.currency.trim() || 'EGP',
            tax_percentage: parseFloat(settings.tax_percentage) || 0,
        };

        try {
            const res = await fetch('/api/admin/settings', {
                method: 'POST',
                headers: adminHeaders(),
                body: JSON.stringify({ payload }),
            });
            const json = await res.json();

            if (!res.ok) {
                console.error('Error saving settings:', json.error);
                showToast(`Failed to save settings: ${json.error || 'Unknown error'}`, 'error' as 'cart' | 'wishlist');
            } else {
                showToast('Checkout & Shipping Settings saved successfully!', 'cart');
            }
        } catch (err) {
            console.error('Failed to save settings:', err);
            showToast('Network error while saving settings', 'error' as 'cart' | 'wishlist');
        } finally {
            setSaving(false);
        }
    };

    if (loading) return (
        <AdminLayout>
            <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100%' }}>
                <Loader2 className="spin" size={40} />
            </div>
        </AdminLayout>
    );

    return (
        <AdminLayout>
            <div style={{ padding: '40px', maxWidth: '850px' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '40px' }}>
                    <div>
                        <h1 style={{ fontSize: '1.8rem', marginBottom: '8px' }}>Store Settings & Shipping</h1>
                        <p style={{ color: 'var(--text-muted)' }}>Configure default shipping fees, free shipping rules, and store information.</p>
                    </div>
                    <button
                        onClick={handleSave}
                        disabled={saving}
                        style={{
                            background: '#1E1A17',
                            color: 'white',
                            border: 'none',
                            padding: '12px 24px',
                            borderRadius: '4px',
                            display: 'flex',
                            alignItems: 'center',
                            gap: '8px',
                            cursor: 'pointer',
                            fontWeight: '600',
                            fontFamily: 'var(--font-sans)',
                            opacity: saving ? 0.7 : 1
                        }}
                    >
                        {saving ? <Loader2 className="spin" size={16} /> : <Save size={16} />}
                        {saving ? 'Saving...' : 'Save Settings'}
                    </button>
                </div>

                <div style={{ display: 'grid', gap: '32px' }}>
                    {/* Shipping & Checkout Rules */}
                    <div style={{ background: 'white', padding: '32px', border: '1px solid var(--border-subtle)', borderRadius: '6px' }}>
                        <h2 style={{ fontSize: '1.18rem', marginBottom: '8px', display: 'flex', alignItems: 'center', gap: '10px', color: '#1E1A17' }}>
                            <Truck size={20} color="#8B5E3C" /> Checkout & Shipping Fees
                        </h2>
                        <p style={{ fontSize: '0.88rem', color: '#64748b', marginBottom: '24px' }}>
                            Adjust default shipping fees and set free delivery threshold rules for checkout.
                        </p>

                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>
                                    Default Shipping Fee (EGP)
                                </label>
                                <div style={{ position: 'relative' }}>
                                    <Truck size={16} style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                                    <input
                                        type="number"
                                        value={settings.shipping_fee}
                                        onChange={e => setSettings({ ...settings, shipping_fee: e.target.value })}
                                        placeholder="75"
                                        style={{ padding: '12px 12px 12px 40px', width: '100%', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none', borderRadius: '4px' }}
                                    />
                                </div>
                                <span style={{ fontSize: '0.75rem', color: '#94a3b8' }}>Applies to all standard customer deliveries across Egypt</span>
                            </div>

                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>
                                    Free Shipping Threshold (EGP)
                                </label>
                                <div style={{ position: 'relative' }}>
                                    <ShieldAlert size={16} style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                                    <input
                                        type="number"
                                        value={settings.free_shipping_threshold}
                                        onChange={e => setSettings({ ...settings, free_shipping_threshold: e.target.value })}
                                        placeholder="0 (Set >0 to enable free shipping over amount)"
                                        style={{ padding: '12px 12px 12px 40px', width: '100%', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none', borderRadius: '4px' }}
                                    />
                                </div>
                                <span style={{ fontSize: '0.75rem', color: '#94a3b8' }}>Set to 0 to disable. Example: 1000 = Free delivery over 1000 EGP</span>
                            </div>

                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>
                                    Tax Percentage (%)
                                </label>
                                <input
                                    type="number"
                                    value={settings.tax_percentage}
                                    onChange={e => setSettings({ ...settings, tax_percentage: e.target.value })}
                                    placeholder="0"
                                    style={{ padding: '12px', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none', borderRadius: '4px' }}
                                />
                            </div>

                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>
                                    Currency Code
                                </label>
                                <input
                                    value={settings.currency}
                                    onChange={e => setSettings({ ...settings, currency: e.target.value })}
                                    placeholder="EGP"
                                    style={{ padding: '12px', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none', borderRadius: '4px' }}
                                />
                            </div>
                        </div>
                    </div>

                    {/* General & Support Information */}
                    <div style={{ background: 'white', padding: '32px', border: '1px solid var(--border-subtle)', borderRadius: '6px' }}>
                        <h2 style={{ fontSize: '1.18rem', marginBottom: '24px', display: 'flex', alignItems: 'center', gap: '10px' }}>
                            <Globe size={18} /> General Information & Contact
                        </h2>
                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>Store Name</label>
                                <input
                                    value={settings.store_name}
                                    onChange={e => setSettings({ ...settings, store_name: e.target.value })}
                                    style={{ padding: '12px', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none', borderRadius: '4px' }}
                                />
                            </div>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>Contact Email</label>
                                <div style={{ position: 'relative' }}>
                                    <Mail size={16} style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                                    <input
                                        type="email"
                                        value={settings.contact_email}
                                        onChange={e => setSettings({ ...settings, contact_email: e.target.value })}
                                        style={{ padding: '12px 12px 12px 40px', width: '100%', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none', borderRadius: '4px' }}
                                    />
                                </div>
                            </div>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px', gridColumn: 'span 2' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>WhatsApp Number</label>
                                <div style={{ position: 'relative' }}>
                                    <Phone size={16} style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                                    <input
                                        value={settings.whatsapp_number}
                                        onChange={e => setSettings({ ...settings, whatsapp_number: e.target.value })}
                                        style={{ padding: '12px 12px 12px 40px', width: '100%', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none', borderRadius: '4px' }}
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AdminLayout>
    );
}
