import React from 'react';
import AdminLayout from '@/components/admin/AdminLayout';

export default function SettingsPage() {
    return (
        <AdminLayout>
            <div style={{ padding: '40px' }}>
                <h1 style={{ fontSize: '1.8rem', marginBottom: '8px' }}>Settings</h1>
                <p style={{ color: 'var(--text-muted)' }}>Store settings configuration will be available here soon.</p>
            </div>
        </AdminLayout>
    );
}
