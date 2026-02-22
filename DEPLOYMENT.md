# Deployment Documentation - SEASONS BY NATURE

Since you have a **WordPress Hosting Plan** at Bluehost, follow these steps to deploy your premium e-commerce site.

## 1. Prepare for Static Hosting

Since your plan is designed for WordPress (PHP), it cannot run a live Node.js server. We will convert your website into a **Static Site** (HTML/CSS/JS) that works perfectly on your plan.

### Step 1: Build the Site Locally

On your computer, open the terminal in your project folder and run:

```bash
npm run build
```

This will create a new folder named **`out`** in your project directory. This folder contains your entire website ready for the internet.

### Step 2: Upload to Bluehost

1. Compress everything **inside** the `out` folder into a **.zip** file.
2. Login to **cPanel > File Manager**.
3. Go to the **`public_html`** folder (this is the root of your domain).
4. **Upload** your `.zip` file there.
5. **Extract** it. You should see `index.html`, `_next`, etc., directly inside `public_html`.

---

## 2. Pointing your Domain (seasonsbynature.com)

If your domain is already at Bluehost, it's likely already pointing to `public_html`. If not:

### Update DNS A Records

| Type | Host | Points to | TTL |
| :--- | :--- | :--- | :--- |
| A | @ | `66.81.203.198` | 2 Hours |
| A | www | `66.81.203.198` | 2 Hours |

---

## 3. Alternative: Vercel (Recommended)

If you find cPanel difficult, the "Industry Standard" for Next.js is **Vercel** (Free):

1. Connect your project to **Vercel.com**.
2. Update your domain's **Nameservers** in Bluehost to point to Vercel.
3. This gives you better speed, automatic SSL, and global performance.

---
**Note**: Since we are using **Supabase** for your database, your real-time data will still work perfectly on your WordPress plan!
