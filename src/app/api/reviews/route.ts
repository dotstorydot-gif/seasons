import { NextResponse } from 'next/server';
// import { saveReview } from '@/lib/db'; // Placeholder for persistence

export async function POST(request: Request) {
  try {
    const data = await request.json();
    const required = ['name', 'phone'];
    for (const field of required) {
      if (!data[field]) {
        return NextResponse.json({ error: `${field} is required` }, { status: 400 });
      }
    }
    console.log('New review:', data);
    return NextResponse.json({ success: true });
  } catch (_) {
    return NextResponse.json({ error: 'Invalid JSON' }, { status: 400 });
  }
}
