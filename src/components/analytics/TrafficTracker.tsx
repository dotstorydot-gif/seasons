"use client";

import { usePathname } from "next/navigation";
import { useEffect, useRef } from "react";

function getOrCreateSessionId(): string {
  if (typeof window === "undefined") return "";
  let sid = sessionStorage.getItem("seasons_analytics_sid");
  if (!sid) {
    sid = "sess_" + Math.random().toString(36).substring(2, 11) + "_" + Date.now();
    sessionStorage.setItem("seasons_analytics_sid", sid);
  }
  return sid;
}

export function TrafficTracker() {
  const pathname = usePathname();
  const lastPingTime = useRef<number>(0);

  useEffect(() => {
    // Do not track admin portal pages or API routes
    if (!pathname || pathname.startsWith("/admin") || pathname.startsWith("/api")) {
      return;
    }

    const sessionId = getOrCreateSessionId();
    if (!sessionId) return;

    const sendPing = async () => {
      try {
        const referrer = typeof document !== "undefined" ? document.referrer : "";
        await fetch("/api/analytics/ping", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            sessionId,
            path: pathname,
            referrer,
          }),
        });
        lastPingTime.current = Date.now();
      } catch {
        // Silent catch for analytics ping
      }
    };

    // Initial ping on navigation
    sendPing();

    // Heartbeat ping every 30 seconds while staying on the page
    const interval = setInterval(() => {
      // Only ping if active in document
      if (document.visibilityState === "visible") {
        sendPing();
      }
    }, 30000);

    return () => clearInterval(interval);
  }, [pathname]);

  return null;
}
