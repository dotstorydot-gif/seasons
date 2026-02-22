-- Enable Row Level Security
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
-- Create policies to allow public read access
CREATE POLICY "Allow public read access for categories" ON public.categories FOR
SELECT TO anon USING (true);
CREATE POLICY "Allow public read access for products" ON public.products FOR
SELECT TO anon USING (true);
-- Also allow authenticated users (just in case)
CREATE POLICY "Allow authenticated read access for categories" ON public.categories FOR
SELECT TO authenticated USING (true);
CREATE POLICY "Allow authenticated read access for products" ON public.products FOR
SELECT TO authenticated USING (true);