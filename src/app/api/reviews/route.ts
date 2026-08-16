import { NextRequest, NextResponse } from 'next/server';
import { saveReview, ReviewPayload } from '@/lib/db';
import { checkRateLimit } from '@/lib/rateLimit';

const RATING_FIELDS: (keyof Omit<ReviewPayload, 'name' | 'phone' | 'created_at'>)[] = [
  'quality',
  'durability',
  'shape',
  'packaging',
  'deliveryTime',
  'deliverySpeed',
  'shippingCompany',
];

export async function POST(request: NextRequest) {
  // --- Rate limiting: max 5 review submissions per 10 minutes per IP ---
  const rateLimitError = checkRateLimit(request, { limit: 5, windowMs: 10 * 60 * 1000 });
  if (rateLimitError) return rateLimitError;

  try {
    let data: Partial<ReviewPayload>;
    try {
      data = await request.json();
    } catch {
      return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
    }

    const { name, phone } = data;

    // Validate string fields
    if (!name || typeof name !== 'string' || !name.trim() || name.trim().length > 100) {
      return NextResponse.json({ error: 'Valid name is required (max 100 chars)' }, { status: 400 });
    }

    if (!phone || typeof phone !== 'string' || !phone.trim() || phone.trim().length > 30) {
      return NextResponse.json({ error: 'Valid phone number is required (max 30 chars)' }, { status: 400 });
    }

    // Validate rating fields (must be numbers between 0 and 5)
    for (const field of RATING_FIELDS) {
      const rawVal = data[field];
      const val = typeof rawVal === 'number' ? rawVal : Number(rawVal);
      if (isNaN(val) || val < 0 || val > 5 || !Number.isInteger(val)) {
        return NextResponse.json({ error: `${field} must be an integer rating between 0 and 5` }, { status: 400 });
      }
    }

    const cleanPayload: ReviewPayload = {
      name: name.trim(),
      phone: phone.trim(),
      quality: Number(data.quality ?? 0),
      durability: Number(data.durability ?? 0),
      shape: Number(data.shape ?? 0),
      packaging: Number(data.packaging ?? 0),
      deliveryTime: Number(data.deliveryTime ?? 0),
      deliverySpeed: Number(data.deliverySpeed ?? 0),
      shippingCompany: Number(data.shippingCompany ?? 0),
    };

    await saveReview(cleanPayload);

    return NextResponse.json({ success: true });
  } catch (error: unknown) {
    const message = error instanceof Error ? error.message : 'Failed to submit review';
    console.error('Error in review API route:', error);
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
