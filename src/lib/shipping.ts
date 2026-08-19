export interface GovernorateShipping {
    code: string;
    nameEn: string;
    nameAr: string;
    fee: number;
    region: 'cairo_giza' | 'alexandria' | 'delta' | 'upper_egypt' | 'other';
}

export const EGYPT_GOVERNORATES: GovernorateShipping[] = [
    // Cairo & Giza — 70 EGP
    { code: 'Cairo', nameEn: 'Cairo', nameAr: 'القاهرة', fee: 70, region: 'cairo_giza' },
    { code: 'Giza', nameEn: 'Giza', nameAr: 'الجيزة', fee: 70, region: 'cairo_giza' },

    // Alexandria — 75 EGP
    { code: 'Alexandria', nameEn: 'Alexandria', nameAr: 'الإسكندرية', fee: 75, region: 'alexandria' },

    // Delta — 85 EGP
    { code: 'Qalyubia', nameEn: 'Qalyubia', nameAr: 'القليوبية', fee: 85, region: 'delta' },
    { code: 'Sharqia', nameEn: 'Sharqia', nameAr: 'الشرقية', fee: 85, region: 'delta' },
    { code: 'Gharbia', nameEn: 'Gharbia', nameAr: 'الغربية', fee: 85, region: 'delta' },
    { code: 'Monufia', nameEn: 'Monufia', nameAr: 'المنوفية', fee: 85, region: 'delta' },
    { code: 'Dakahlia', nameEn: 'Dakahlia', nameAr: 'الدقهلية', fee: 85, region: 'delta' },
    { code: 'Beheira', nameEn: 'Beheira', nameAr: 'البحيرة', fee: 85, region: 'delta' },
    { code: 'Damietta', nameEn: 'Damietta', nameAr: 'دمياط', fee: 85, region: 'delta' },
    { code: 'Kafr El Sheikh', nameEn: 'Kafr El Sheikh', nameAr: 'كفر الشيخ', fee: 85, region: 'delta' },

    // Upper Egypt — 100 EGP
    { code: 'Fayoum', nameEn: 'Fayoum', nameAr: 'الفيوم', fee: 100, region: 'upper_egypt' },
    { code: 'Beni Suef', nameEn: 'Beni Suef', nameAr: 'بني سويف', fee: 100, region: 'upper_egypt' },
    { code: 'Minya', nameEn: 'Minya', nameAr: 'المنيا', fee: 100, region: 'upper_egypt' },
    { code: 'Asyut', nameEn: 'Asyut', nameAr: 'أسيوط', fee: 100, region: 'upper_egypt' },
    { code: 'Sohag', nameEn: 'Sohag', nameAr: 'سوهاج', fee: 100, region: 'upper_egypt' },
    { code: 'Qena', nameEn: 'Qena', nameAr: 'قنا', fee: 100, region: 'upper_egypt' },
    { code: 'Luxor', nameEn: 'Luxor', nameAr: 'الأقصر', fee: 100, region: 'upper_egypt' },
    { code: 'Aswan', nameEn: 'Aswan', nameAr: 'أسوان', fee: 100, region: 'upper_egypt' },

    // Canal & Remote — 100 EGP
    { code: 'Suez', nameEn: 'Suez', nameAr: 'السويس', fee: 100, region: 'other' },
    { code: 'Port Said', nameEn: 'Port Said', nameAr: 'بورسعيد', fee: 100, region: 'other' },
    { code: 'Ismailia', nameEn: 'Ismailia', nameAr: 'الإسماعيلية', fee: 100, region: 'other' },
    { code: 'Red Sea', nameEn: 'Red Sea (Hurghada)', nameAr: 'البحر الأحمر (الغردقة)', fee: 100, region: 'other' },
    { code: 'South Sinai', nameEn: 'South Sinai (Sharm El Sheikh)', nameAr: 'جنوب سيناء (شرم الشيخ)', fee: 100, region: 'other' },
    { code: 'North Sinai', nameEn: 'North Sinai', nameAr: 'شمال سيناء', fee: 100, region: 'other' },
    { code: 'Matrouh', nameEn: 'Matrouh', nameAr: 'مطروح', fee: 100, region: 'other' },
    { code: 'New Valley', nameEn: 'New Valley', nameAr: 'الوادي الجديد', fee: 100, region: 'other' },
];

/**
 * Calculates shipping fee based on customer city/governorate.
 * Cairo/Giza: 70 EGP | Alexandria: 75 EGP | Delta: 85 EGP | Upper Egypt & Remote: 100 EGP
 */
export function getShippingFeeForCity(city?: string | null, fallbackFee: number = 70): number {
    if (!city) return fallbackFee;
    const normalized = city.trim().toLowerCase();
    const gov = EGYPT_GOVERNORATES.find(g => 
        g.code.toLowerCase() === normalized || 
        g.nameEn.toLowerCase() === normalized || 
        g.nameAr.toLowerCase() === normalized
    );
    if (gov) return gov.fee;

    // Fuzzy matching for Cairo / Giza
    if (normalized.includes('cairo') || normalized.includes('قاهرة') || normalized.includes('giza') || normalized.includes('جيزة')) {
        return 70;
    }
    // Alexandria
    if (normalized.includes('alex') || normalized.includes('إسكندرية') || normalized.includes('اسكندرية')) {
        return 75;
    }
    // Delta
    if (
        normalized.includes('sharqia') || normalized.includes('شرقية') ||
        normalized.includes('gharbia') || normalized.includes('غربية') ||
        normalized.includes('monufia') || normalized.includes('منوفية') ||
        normalized.includes('dakahlia') || normalized.includes('دقهلية') ||
        normalized.includes('beheira') || normalized.includes('بحيرة') ||
        normalized.includes('damietta') || normalized.includes('دمياط') ||
        normalized.includes('qalyubia') || normalized.includes('قليوبية') ||
        normalized.includes('kafr') || normalized.includes('كفر')
    ) {
        return 85;
    }
    // Upper Egypt & Remote
    if (
        normalized.includes('fayoum') || normalized.includes('فيوم') ||
        normalized.includes('suef') || normalized.includes('سويف') ||
        normalized.includes('minya') || normalized.includes('منيا') ||
        normalized.includes('asyut') || normalized.includes('أسيوط') ||
        normalized.includes('sohag') || normalized.includes('سوهاج') ||
        normalized.includes('qena') || normalized.includes('قنا') ||
        normalized.includes('luxor') || normalized.includes('أقصر') ||
        normalized.includes('aswan') || normalized.includes('أسوان')
    ) {
        return 100;
    }

    return fallbackFee;
}
