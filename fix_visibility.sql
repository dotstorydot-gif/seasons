-- Enable Row Level Security
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
-- 1. DROP existing policies if they exist (to avoid "already exists" errors)
DROP POLICY IF EXISTS "Allow public read access for categories" ON public.categories;
DROP POLICY IF EXISTS "Allow public read access for products" ON public.products;
DROP POLICY IF EXISTS "Allow authenticated read access for categories" ON public.categories;
DROP POLICY IF EXISTS "Allow authenticated read access for products" ON public.products;
-- 2. Create policies to allow public read access
CREATE POLICY "Allow public read access for categories" ON public.categories FOR
SELECT TO anon USING (true);
CREATE POLICY "Allow public read access for products" ON public.products FOR
SELECT TO anon USING (true);
-- 3. Also allow authenticated users
CREATE POLICY "Allow authenticated read access for categories" ON public.categories FOR
SELECT TO authenticated USING (true);
CREATE POLICY "Allow authenticated read access for products" ON public.products FOR
SELECT TO authenticated USING (true);