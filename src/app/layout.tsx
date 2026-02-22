import type { Metadata } from "next";
import { Poppins } from "next/font/google";
import "./globals.css";
import { LanguageProvider } from "@/context/LanguageContext";
import { CartProvider } from "@/context/CartContext";
import { WishlistProvider } from "@/context/WishlistContext";
import { ToastProvider } from "@/context/ToastContext";
import Shell from "@/components/layout/Shell";
import { Analytics } from "@vercel/analytics/react";
import { SpeedInsights } from "@vercel/speed-insights/react";
import { FacebookPixel } from "@/components/marketing/FacebookPixel";
import { CustomScripts } from "@/components/marketing/CustomScripts";

const poppins = Poppins({
  variable: "--font-sans",
  subsets: ["latin"],
  weight: ["300", "400", "500", "600", "700"],
  display: "swap",
});

const poppinsSerif = Poppins({
  variable: "--font-serif",
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  display: "swap",
});

export const metadata: Metadata = {
  title: {
    default: "Seasons by Nature | Handcrafted Wooden Pieces",
    template: "%s | Seasons by Nature"
  },
  description: "Timeless wooden pieces for the modern home. Handcrafted with love and natural materials.",
  keywords: ["handcrafted", "wooden decor", "modern home", "natural materials", "interior design", "egyptian crafts"],
  authors: [{ name: "Seasons by Nature" }],
  creator: "Seasons by Nature",
  publisher: "Seasons by Nature",
  robots: "index, follow",
  openGraph: {
    type: "website",
    locale: "en_US",
    url: "https://seasons-nature.com",
    title: "Seasons by Nature | Handcrafted Wooden Pieces",
    description: "Timeless wooden pieces for the modern home. Handcrafted with love.",
    siteName: "Seasons by Nature",
    images: [{
      url: "/og-image.jpg",
      width: 1200,
      height: 630,
      alt: "Seasons by Nature Collection"
    }],
  },
  twitter: {
    card: "summary_large_image",
    title: "Seasons by Nature | Handcrafted Wooden Pieces",
    description: "Timeless wooden pieces for the modern home. Handcrafted with love.",
    images: ["/og-image.jpg"],
  },
  icons: {
    icon: "/favicon.ico",
    shortcut: "/favicon.ico",
    apple: "/apple-touch-icon.png",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={`${poppins.variable} ${poppinsSerif.variable} antialiased`}>
        <LanguageProvider>
          <CartProvider>
            <WishlistProvider>
              <ToastProvider>
                <Shell>{children}</Shell>
              </ToastProvider>
            </WishlistProvider>
          </CartProvider>
        </LanguageProvider>
        <Analytics />
        <SpeedInsights />
        <FacebookPixel />
        <CustomScripts />
      </body>
    </html>
  );
}
