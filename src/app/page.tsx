import Hero from "@/components/home/Hero";
import FeaturedProducts from "@/components/home/FeaturedProducts";
import Categories from "@/components/home/Categories";
import Reviews from "@/components/home/Reviews";
import WhatsAppButton from "@/components/ui/WhatsAppButton";
import EmailPopup from "@/components/ui/EmailPopup";

export default function Home() {
  return (
    <>
      <Hero />
      <FeaturedProducts />
      <Categories />
      <Reviews />
      <WhatsAppButton />
      <EmailPopup />
    </>
  );
}
