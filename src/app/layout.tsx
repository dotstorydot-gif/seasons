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
  title: "Seasons by Nature | Handcrafted Wooden Pieces",
  description: "Timeless wooden pieces for the modern home. Handcrafted with love.",
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
