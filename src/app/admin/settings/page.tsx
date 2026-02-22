"use client";

import React, { useState, useEffect } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import { Save, Loader2, Globe, Mail, Phone, Truck } from 'lucide-react';
import { supabase } from '@/lib/supabase';
import { useToast } from '@/context/ToastContext';

export default function SettingsPage() {
    const { showToast } = useToast();
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);
    const [settings, setSettings] = useState({
        store_name: 'Seasons',
        contact_email: 'contact@seasons.com',
        whatsapp_number: '+201234567890',
        shipping_fee: '30',
        currency: 'EGP',
        tax_percentage: '0'
    });

    useEffect(() => {
        const fetchSettings = async () => {
            setLoading(true);
            // Try to fetch from a 'settings' table, fallback to defaults if it fails
            const { data, error } = await supabase.from('settings').select('*').single();
            if (data && !error) {
                setSettings({
                    store_name: data.store_name || '',
                    contact_email: data.contact_email || '',
                    whatsapp_number: data.whatsapp_number || '',
                    shipping_fee: data.shipping_fee?.toString() || '30',
                    currency: data.currency || 'EGP',
                    tax_percentage: data.tax_percentage?.toString() || '0'
                });
            }
            setLoading(false);
        };
        fetchSettings();
    }, []);

    const handleSave = async () => {
        setSaving(true);
        const payload = {
            ...settings,
            shipping_fee: parseFloat(settings.shipping_fee) || 0,
            tax_percentage: parseFloat(settings.tax_percentage) || 0,
            updated_at: new Date().toISOString()
        };

        const { error } = await supabase.from('settings').upsert([payload]);

        if (error) {
            console.error('Error saving settings:', error);
            showToast('Failed to save settings. Please ensure the settings table exists in Supabase.', 'error' as 'cart' | 'wishlist');
        } else {
            showToast('Settings saved successfully!', 'cart');
        }
        setSaving(false);
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
            <div style={{ padding: '40px', maxWidth: '800px' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '40px' }}>
                    <div>
                        <h1 style={{ fontSize: '1.8rem', marginBottom: '8px' }}>Store Settings</h1>
                        <p style={{ color: 'var(--text-muted)' }}>Configure your general store information and preferences.</p>
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
                    {/* General Settings */}
                    <div style={{ background: 'white', padding: '32px', border: '1px solid var(--border-subtle)', borderRadius: '4px' }}>
                        <h2 style={{ fontSize: '1.1rem', marginBottom: '24px', display: 'flex', alignItems: 'center', gap: '10px' }}>
                            <Globe size={18} /> General Information
                        </h2>
                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>Store Name</label>
                                <input
                                    value={settings.store_name}
                                    onChange={e => setSettings({ ...settings, store_name: e.target.value })}
                                    style={{ padding: '12px', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none' }}
                                />
                            </div>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>Currency Code</label>
                                <input
                                    value={settings.currency}
                                    onChange={e => setSettings({ ...settings, currency: e.target.value })}
                                    style={{ padding: '12px', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none' }}
                                />
                            </div>
                        </div>
                    </div>

                    {/* Contact Settings */}
                    <div style={{ background: 'white', padding: '32px', border: '1px solid var(--border-subtle)', borderRadius: '4px' }}>
                        <h2 style={{ fontSize: '1.1rem', marginBottom: '24px', display: 'flex', alignItems: 'center', gap: '10px' }}>
                            <Mail size={18} /> Contact & Support
                        </h2>
                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>Contact Email</label>
                                <div style={{ position: 'relative' }}>
                                    <Mail size={16} style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                                    <input
                                        type="email"
                                        value={settings.contact_email}
                                        onChange={e => setSettings({ ...settings, contact_email: e.target.value })}
                                        style={{ padding: '12px 12px 12px 40px', width: '100%', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none' }}
                                    />
                                </div>
                            </div>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>WhatsApp Number</label>
                                <div style={{ position: 'relative' }}>
                                    <Phone size={16} style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                                    <input
                                        value={settings.whatsapp_number}
                                        onChange={e => setSettings({ ...settings, whatsapp_number: e.target.value })}
                                        style={{ padding: '12px 12px 12px 40px', width: '100%', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none' }}
                                    />
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Shipping & Tax */}
                    <div style={{ background: 'white', padding: '32px', border: '1px solid var(--border-subtle)', borderRadius: '4px' }}>
                        <h2 style={{ fontSize: '1.1rem', marginBottom: '24px', display: 'flex', alignItems: 'center', gap: '10px' }}>
                            <Truck size={18} /> Checkout & Shipping
                        </h2>
                        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>Default Shipping Fee</label>
                                <div style={{ position: 'relative' }}>
                                    <Truck size={16} style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }} />
                                    <input
                                        type="number"
                                        value={settings.shipping_fee}
                                        onChange={e => setSettings({ ...settings, shipping_fee: e.target.value })}
                                        style={{ padding: '12px 12px 12px 40px', width: '100%', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none' }}
                                    />
                                </div>
                            </div>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                <label style={{ fontSize: '0.8rem', fontWeight: '600', textTransform: 'uppercase', color: 'var(--text-muted)' }}>Tax Percentage (%)</label>
                                <input
                                    type="number"
                                    value={settings.tax_percentage}
                                    onChange={e => setSettings({ ...settings, tax_percentage: e.target.value })}
                                    style={{ padding: '12px', background: 'var(--bg-primary)', border: '1px solid var(--border-subtle)', outline: 'none' }}
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AdminLayout >
    );
}
