import { MetadataRoute } from 'next';
import { supabase } from '@/lib/supabase';

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
    const baseUrl = 'https://seasons-nature.com';

    // Fetch all products
    const { data: products } = await supabase.from('products').select('id, updated_at');

    const productUrls = (products || []).map((p) => ({
        url: `${baseUrl}/product/${p.id}`,
        lastModified: new Date(p.updated_at || new Date()),
        changeFrequency: 'weekly' as const,
        priority: 0.8,
    }));

    const staticUrls = [
        { url: baseUrl, lastModified: new Date(), changeFrequency: 'daily' as const, priority: 1 },
        { url: `${baseUrl}/shop`, lastModified: new Date(), changeFrequency: 'daily' as const, priority: 0.9 },
        { url: `${baseUrl}/cart`, lastModified: new Date(), changeFrequency: 'monthly' as const, priority: 0.3 },
        { url: `${baseUrl}/privacy-policy`, lastModified: new Date(), changeFrequency: 'yearly' as const, priority: 0.2 },
    ];

    return [...staticUrls, ...productUrls];
}
