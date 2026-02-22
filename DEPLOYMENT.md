# Deployment Documentation - SEASONS BY NATURE

I have successfully connected your project to GitHub: `https://github.com/dotstorydot-gif/seasons.git`.

You can now deploy your site to **Vercel** for the best performance and easiest management.

## 1. Deploy to Vercel (Recommended)

1. Login to **[Vercel.com](https://vercel.com)** using your GitHub account.
2. Click **"Add New" > "Project"**.
3. Import the **`seasons`** repository.
4. **Environment Variables**: During setup, add your Supabase credentials (copy them from your local `.env.local`):
    - `NEXT_PUBLIC_SUPABASE_URL`
    - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
5. Click **Deploy**.

## 2. Pointing seasonsbynature.com to Vercel

Once deployed on Vercel:

1. Go to the **Settings > Domains** tab in your Vercel project.
2. Add `seasonsbynature.com`.
3. Follow the instructions to update your **Nameservers** in Bluehost to:
    - `ns1.vercel-dns.com`
    - `ns2.vercel-dns.com`

---

## 3. Alternative: WordPress Hosting (Static Export)

If you still wish to use your WordPress plan:

1. Run `npm run build` locally.
2. Upload the contents of the **`out`** folder to your Bluehost `public_html` via FTP or File Manager.

---
**Note**: I have already pushed the latest code to your branch `main`. Any changes you make and push to GitHub will automatically update your Vercel site!
