import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

/**
 * Admin Supabase client using the service role key.
 * NOTE: Only use this in admin-protected pages/routes — never expose to the public.
 * This bypasses Row Level Security for trusted admin operations.
 */
export const supabaseAdmin = createClient(supabaseUrl, serviceRoleKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false,
    },
});
