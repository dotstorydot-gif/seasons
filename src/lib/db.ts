import { supabaseAdmin } from '@/lib/supabaseAdmin';

export interface ReviewPayload {
  name: string;
  phone: string;
  quality: number;
  durability: number;
  shape: number;
  packaging: number;
  deliveryTime: number;
  deliverySpeed: number;
  shippingCompany: number;
  created_at?: string;
}

/** Save a review to the Supabase "reviews" table */
export async function saveReview(payload: ReviewPayload) {
  const { error } = await supabaseAdmin.from('reviews').insert({
    ...payload,
    created_at: new Date().toISOString(),
  });
  if (error) {
    console.error('Failed to save review:', error);
    throw error;
  }
}

/** Fetch all reviews (ordered newest first) */
export async function fetchReviews() {
  const { data, error } = await supabaseAdmin
    .from('reviews')
    .select('*')
    .order('created_at', { ascending: false });
  if (error) {
    console.error('Failed to fetch reviews:', error);
    throw error;
  }
  return data;
}
