import React, { useState } from 'react';

interface RatingStarsProps {
  /** Current rating value (1-5) */
  value?: number;
  /** Called when rating changes */
  onChange?: (value: number) => void;
  /** Optional label for accessibility */
  label?: string;
}

/**
 * A reusable star rating component.
 * It renders 5 clickable stars that can be controlled or uncontrolled.
 * Keyboard accessible: left/right arrows change rating, space/enter selects.
 */
export const RatingStars: React.FC<RatingStarsProps> = ({ value = 0, onChange, label = 'Rating' }) => {
  const [hover, setHover] = useState(0);
  const rating = hover || value;

  const handleClick = (star: number) => {
    onChange && onChange(star);
  };

  const handleKey = (e: React.KeyboardEvent<HTMLDivElement>) => {
    let newRating = value;
    if (e.key === 'ArrowRight' && newRating < 5) newRating++;
    if (e.key === 'ArrowLeft' && newRating > 1) newRating--;
    if ((e.key === 'Enter' || e.key === ' ') && hover) newRating = hover;
    if (newRating !== value) {
      onChange && onChange(newRating);
    }
  };

  return (
    <div
      role="radiogroup"
      aria-label={label}
      tabIndex={0}
      onKeyDown={handleKey}
      className="rating-stars"
    >
      {Array.from({ length: 5 }, (_, i) => i + 1).map((star) => (
        <svg
          key={star}
          onMouseEnter={() => setHover(star)}
          onMouseLeave={() => setHover(0)}
          onClick={() => handleClick(star)}
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 24 24"
          fill={star <= rating ? 'currentColor' : 'none'}
          stroke="currentColor"
          strokeWidth={2}
          className="star"
          style={{ cursor: 'pointer', width: '1.5rem', height: '1.5rem', color: 'var(--accent)' }}
        >
          <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z" />
        </svg>
      ))}
    </div>
  );
};
