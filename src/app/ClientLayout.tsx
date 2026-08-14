"use client";

import { usePathname } from "next/navigation";
import { useEffect } from "react";
import * as gtag from "@/lib/gtag";
import { Analytics } from "@vercel/analytics/react";
import { SpeedInsights } from "@vercel/speed-insights/react";
import { FacebookPixel } from "@/components/marketing/FacebookPixel";
import { CustomScripts } from "@/components/marketing/CustomScripts";
import { LanguageProvider } from "@/context/LanguageContext";
import { CartProvider } from "@/context/CartContext";
import { WishlistProvider } from "@/context/WishlistContext";
import { ToastProvider } from "@/context/ToastContext";
import Shell from "@/components/layout/Shell";

import { TrafficTracker } from "@/components/analytics/TrafficTracker";

function RouteTracker() {
  const pathname = usePathname();
  useEffect(() => {
    gtag.pageview(pathname);
  }, [pathname]);
  return null;
}

export default function ClientLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <>
      <Analytics />
      <SpeedInsights />
      <FacebookPixel />
      <CustomScripts />
      <TrafficTracker />
      <LanguageProvider>
        <CartProvider>
          <WishlistProvider>
            <ToastProvider>
              <Shell>{children}</Shell>
            </ToastProvider>
          </WishlistProvider>
        </CartProvider>
      </LanguageProvider>
      <RouteTracker />
    </>
  );
}
