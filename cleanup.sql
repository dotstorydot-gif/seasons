-- CLEANUP SCRIPT: Run this in Supabase SQL Editor to remove dummy data
-- WARNING: This will delete ALL products and categories that are NOT from your official list.
-- 1. Delete all products except those in your SKU list (if you want to keep them)
-- Alternatively, if you want a fresh start before running bulk_import.sql:
DELETE FROM public.products;
DELETE FROM public.categories;
-- After running this, re-run bulk_import.sql to restore your real products and categories.