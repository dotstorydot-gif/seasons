import { supabaseAdmin } from './supabaseAdmin';

export interface StoreSettings {
    id?: string;
    store_name: string;
    contact_email: string;
    whatsapp_number: string;
    shipping_fee: number;
    free_shipping_threshold: number;
    currency: string;
    tax_percentage: number;
}

export const DEFAULT_SETTINGS: StoreSettings = {
    id: 'default',
    store_name: 'Seasons',
    contact_email: 'contact@seasons.com',
    whatsapp_number: '+201234567890',
    shipping_fee: 75,
    free_shipping_threshold: 0,
    currency: 'EGP',
    tax_percentage: 0,
};

export async function fetchStoreSettings(): Promise<StoreSettings> {
    try {
        const { data, error } = await supabaseAdmin
            .from('settings')
            .select('*')
            .limit(1)
            .maybeSingle();

        if (error || !data) {
            return DEFAULT_SETTINGS;
        }

        return {
            id: 'default',
            store_name: data.store_name || DEFAULT_SETTINGS.store_name,
            contact_email: data.contact_email || DEFAULT_SETTINGS.contact_email,
            whatsapp_number: data.whatsapp_number || DEFAULT_SETTINGS.whatsapp_number,
            shipping_fee: typeof data.shipping_fee === 'number' ? data.shipping_fee : Number(data.shipping_fee ?? DEFAULT_SETTINGS.shipping_fee),
            free_shipping_threshold: typeof data.free_shipping_threshold === 'number' ? data.free_shipping_threshold : Number(data.free_shipping_threshold ?? DEFAULT_SETTINGS.free_shipping_threshold),
            currency: data.currency || DEFAULT_SETTINGS.currency,
            tax_percentage: typeof data.tax_percentage === 'number' ? data.tax_percentage : Number(data.tax_percentage ?? DEFAULT_SETTINGS.tax_percentage),
        };
    } catch {
        return DEFAULT_SETTINGS;
    }
}
