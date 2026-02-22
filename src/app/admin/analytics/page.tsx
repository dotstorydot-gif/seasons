import React from 'react';
import AdminLayout from '@/components/admin/AdminLayout';

export default function AnalyticsPage() {
    return (
        <AdminLayout>
            <div style={{ padding: '40px' }}>
                <h1 style={{ fontSize: '1.8rem', marginBottom: '8px' }}>Analytics</h1>
                <p style={{ color: 'var(--text-muted)' }}>Detailed analytics are being developed. For now, please refer to the Dashboard overview.</p>
            </div>
        </AdminLayout>
    );
}
