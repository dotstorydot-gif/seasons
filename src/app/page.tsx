import Hero from "@/components/home/Hero";
import FeaturedProducts from "@/components/home/FeaturedProducts";
import Categories from "@/components/home/Categories";
{/* import Reviews from "@/components/home/Reviews"; */ }
import WhatsAppButton from "@/components/ui/WhatsAppButton";
import EmailPopup from "@/components/ui/EmailPopup";
import { Metadata } from 'next';

export const dynamic = 'force-dynamic';

export const metadata: Metadata = {
  title: "Seasons by Nature | Handcrafted Wooden Decor",
  description: "From serving boards to seasonal treasures, every piece is made to turn simple moments into lasting memories.",
  openGraph: {
    title: "Seasons by Nature | Handcrafted Wooden Decor",
    description: "From serving boards to seasonal treasures, every piece is made to turn simple moments into lasting memories.",
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
      {/* <Reviews /> */}
      <WhatsAppButton />
      <EmailPopup />
    </>
  );
}
