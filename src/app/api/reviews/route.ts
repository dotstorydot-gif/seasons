import { NextRequest, NextResponse } from 'next/server';
import { saveReview, ReviewPayload } from '@/lib/db';

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
      const val = data[field];
      if (typeof val !== 'number' || val < 0 || val > 5 || !Number.isInteger(val)) {
        return NextResponse.json({ error: `${field} must be an integer rating between 0 and 5` }, { status: 400 });
      }
    }

    const cleanPayload: ReviewPayload = {
      name: name.trim(),
      phone: phone.trim(),
      quality: data.quality ?? 0,
      durability: data.durability ?? 0,
      shape: data.shape ?? 0,
      packaging: data.packaging ?? 0,
      deliveryTime: data.deliveryTime ?? 0,
      deliverySpeed: data.deliverySpeed ?? 0,
      shippingCompany: data.shippingCompany ?? 0,
    };

    await saveReview(cleanPayload);

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error('Error in review API route:', error);
    return NextResponse.json({ error: 'Failed to submit review' }, { status: 500 });
  }
}
