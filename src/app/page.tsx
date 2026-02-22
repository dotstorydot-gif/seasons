import Hero from "@/components/home/Hero";
import FeaturedProducts from "@/components/home/FeaturedProducts";
import Categories from "@/components/home/Categories";
import Reviews from "@/components/home/Reviews";
import WhatsAppButton from "@/components/ui/WhatsAppButton";
import EmailPopup from "@/components/ui/EmailPopup";
import { Metadata } from 'next';

export const metadata: Metadata = {
  title: "Seasons by Nature | Handcrafted Wooden Decor",
  description: "Exquisite handcrafted wooden pieces for your modern home. From unique trays to artistic carvings, discover the soul of nature in every piece.",
  openGraph: {
    title: "Seasons by Nature | Handcrafted Wooden Decor",
    description: "Exquisite handcrafted wooden pieces for your modern home. Handcrafted with love in Egypt.",
  }
};

const jsonLd = {
  '@context': 'https://schema.org',
  '@type': 'Organization',
  name: 'Seasons by Nature',
  url: 'https://seasons-nature.com',
  logo: 'https://seasons-nature.com/logox.png',
  sameAs: [
    'https://www.instagram.com/seasons.nature/',
    'https://wa.me/201234567890'
  ],
  contactPoint: {
    '@type': 'ContactPoint',
    telephone: '+201234567890',
    contactType: 'customer service'
  }
};

export default function Home() {
  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      <Hero />
      <FeaturedProducts />
      <Categories />
      <Reviews />
      <WhatsAppButton />
      <EmailPopup />
    </>
  );
}
