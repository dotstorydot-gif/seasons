import { NextRequest, NextResponse } from 'next/server';
import { supabaseAdmin } from '@/lib/supabaseAdmin';
import { checkAdminSecret } from '@/lib/adminAuth';

export async function GET(req: NextRequest) {
  const authError = checkAdminSecret(req);
  if (authError) return authError;

  try {
    const { data, error } = await supabaseAdmin
      .from('reviews')
      .select('*')
      .order('created_at', { ascending: false });

    if (error) {
      console.error('Error fetching admin reviews:', error);
      return NextResponse.json({ error: error.message }, { status: 500 });
    }

    return NextResponse.json({ reviews: data || [] });
  } catch (err) {
    console.error('Unexpected error fetching reviews:', err);
    return NextResponse.json({ error: 'Failed to fetch reviews' }, { status: 500 });
  }
}

export async function DELETE(req: NextRequest) {
  const authError = checkAdminSecret(req);
  if (authError) return authError;

  const { searchParams } = new URL(req.url);
  const id = searchParams.get('id');

  if (!id || typeof id !== 'string') {
    return NextResponse.json({ error: 'Review ID is required' }, { status: 400 });
  }

  try {
    const { error } = await supabaseAdmin
      .from('reviews')
      .delete()
      .eq('id', id);

    if (error) {
      console.error('Error deleting review:', error);
      return NextResponse.json({ error: error.message }, { status: 500 });
    }

    return NextResponse.json({ success: true });
  } catch (err) {
    console.error('Unexpected error deleting review:', err);
    return NextResponse.json({ error: 'Failed to delete review' }, { status: 500 });
  }
}
