'use client';

import { useState } from 'react';
import { RatingStars } from '@/components/RatingStars';
import styles from './review.module.css';

interface ReviewPayload {
  name: string;
  phone: string;
  quality: number;
  durability: number;
  shape: number;
  packaging: number;
  deliveryTime: number;
  deliverySpeed: number;
  shippingCompany: number;
}

export default function ReviewPage() {
  const [form, setForm] = useState<ReviewPayload>({
    name: '',
    phone: '',
    quality: 0,
    durability: 0,
    shape: 0,
    packaging: 0,
    deliveryTime: 0,
    deliverySpeed: 0,
    shippingCompany: 0,
  });

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setForm((prev) => ({ ...prev, [name]: value }));
  };

  const handleRating = (field: keyof ReviewPayload) => (value: number) => {
    setForm((prev) => ({ ...prev, [field]: value }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const res = await fetch('/api/reviews', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(form),
      });
      if (res.ok) {
        alert('Thank you for your review!');
        setForm({
          name: '',
          phone: '',
          quality: 0,
          durability: 0,
          shape: 0,
          packaging: 0,
          deliveryTime: 0,
          deliverySpeed: 0,
          shippingCompany: 0,
        });
      } else {
        const errorData = await res.json().catch(() => null);
        alert(errorData?.error || 'Failed to submit review. Please try again.');
      }
    } catch {
      alert('Network error. Failed to submit review.');
    }
  };

  return (
    <div className={styles.container}>
      <h2>Product Review</h2>
      <form onSubmit={handleSubmit}>
        <div className={styles['form-group']}>
          <label htmlFor="name">Name</label>
          <input id="name" name="name" value={form.name} onChange={handleChange} required />
        </div>
        <div className={styles['form-group']}>
          <label htmlFor="phone">Phone</label>
          <input id="phone" name="phone" type="tel" value={form.phone} onChange={handleChange} required />
        </div>
        <div className={styles['form-group']}>
          <label>Quality</label>
          <RatingStars value={form.quality} onChange={handleRating('quality')} />
        </div>
        <div className={styles['form-group']}>
          <label>Durability</label>
          <RatingStars value={form.durability} onChange={handleRating('durability')} />
        </div>
        <div className={styles['form-group']}>
          <label>Shape</label>
          <RatingStars value={form.shape} onChange={handleRating('shape')} />
        </div>
        <div className={styles['form-group']}>
          <label>Packaging</label>
          <RatingStars value={form.packaging} onChange={handleRating('packaging')} />
        </div>
        <div className={styles['form-group']}>
          <label>Delivery Time</label>
          <RatingStars value={form.deliveryTime} onChange={handleRating('deliveryTime')} />
        </div>
        <div className={styles['form-group']}>
          <label>Delivery Speed</label>
          <RatingStars value={form.deliverySpeed} onChange={handleRating('deliverySpeed')} />
        </div>
        <div className={styles['form-group']}>
          <label>Shipping Company</label>
          <RatingStars value={form.shippingCompany} onChange={handleRating('shippingCompany')} />
        </div>
        <button type="submit" className={styles['submit-btn']}>Submit Review</button>
      </form>
    </div>
  );
}
