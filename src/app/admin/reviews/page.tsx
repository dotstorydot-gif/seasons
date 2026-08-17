"use client";

import React, { useState, useEffect, useMemo } from 'react';
import AdminLayout from '@/components/admin/AdminLayout';
import styles from './Reviews.module.css';
import { adminHeaders } from '@/lib/adminHeaders';
import {
  Star,
  Search,
  Download,
  Loader2,
  Trash2,
  Eye,
  X,
  MessageSquare,
  Award,
  Package,
  Truck,
  Sparkles,
} from 'lucide-react';

interface Review {
  id: string;
  name: string;
  phone: string;
  quality: number;
  durability: number;
  shape: number;
  packaging: number;
  delivery_time: number;
  delivery_speed: number;
  shipping_company: number;
  created_at: string;
}

/** Calculate average score across 7 criteria for a review */
function calculateOverallScore(r: Review): number {
  const sum =
    r.quality +
    r.durability +
    r.shape +
    r.packaging +
    r.delivery_time +
    r.delivery_speed +
    r.shipping_company;
  return Number((sum / 7).toFixed(1));
}

export default function AdminReviewsPage() {
  const [reviews, setReviews] = useState<Review[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState('');
  const [ratingFilter, setRatingFilter] = useState<'all' | '5' | '4' | '3' | '2' | '1' | 'low'>('all');
  const [sortBy, setSortBy] = useState<'newest' | 'oldest' | 'highest' | 'lowest'>('newest');

  // Modals state
  const [selectedReview, setSelectedReview] = useState<Review | null>(null);
  const [deletingId, setDeletingId] = useState<string | null>(null);
  const [isDeleting, setIsDeleting] = useState(false);

  useEffect(() => {
    let isMounted = true;
    async function loadReviews() {
      setLoading(true);
      try {
        const res = await fetch('/api/admin/reviews', {
          headers: adminHeaders(),
        });
        if (res.ok) {
          const data = await res.json();
          if (isMounted) setReviews(data.reviews || []);
        } else {
          console.error('Failed to fetch reviews');
        }
      } catch (err) {
        console.error('Error fetching reviews:', err);
      } finally {
        if (isMounted) setLoading(false);
      }
    }
    loadReviews();
    return () => {
      isMounted = false;
    };
  }, []);

  // Overall Statistics
  const stats = useMemo(() => {
    const total = reviews.length;
    if (total === 0) {
      return { total: 0, overallAvg: '0.0', qualityAvg: '0.0', packagingAvg: '0.0', deliverySpeedAvg: '0.0' };
    }

    const overallSum = reviews.reduce((acc, r) => acc + calculateOverallScore(r), 0);
    const qualitySum = reviews.reduce((acc, r) => acc + r.quality, 0);
    const packagingSum = reviews.reduce((acc, r) => acc + r.packaging, 0);
    const deliverySum = reviews.reduce((acc, r) => acc + r.delivery_speed, 0);

    return {
      total,
      overallAvg: (overallSum / total).toFixed(1),
      qualityAvg: (qualitySum / total).toFixed(1),
      packagingAvg: (packagingSum / total).toFixed(1),
      deliverySpeedAvg: (deliverySum / total).toFixed(1),
    };
  }, [reviews]);

  // Search, Filter & Sorting Logic
  const filteredReviews = useMemo(() => {
    return reviews
      .filter((r) => {
        // Search filter (name or phone)
        const q = search.toLowerCase().trim();
        const matchesSearch =
          !q || r.name.toLowerCase().includes(q) || r.phone.includes(q);

        if (!matchesSearch) return false;

        // Rating filter based on overall score rounded
        const score = calculateOverallScore(r);
        const roundedScore = Math.round(score);

        if (ratingFilter === '5') return roundedScore === 5;
        if (ratingFilter === '4') return roundedScore === 4;
        if (ratingFilter === '3') return roundedScore === 3;
        if (ratingFilter === '2') return roundedScore === 2;
        if (ratingFilter === '1') return roundedScore === 1;
        if (ratingFilter === 'low') return score <= 2.5;

        return true;
      })
      .sort((a, b) => {
        if (sortBy === 'newest') {
          return new Date(b.created_at).getTime() - new Date(a.created_at).getTime();
        }
        if (sortBy === 'oldest') {
          return new Date(a.created_at).getTime() - new Date(b.created_at).getTime();
        }
        if (sortBy === 'highest') {
          return calculateOverallScore(b) - calculateOverallScore(a);
        }
        if (sortBy === 'lowest') {
          return calculateOverallScore(a) - calculateOverallScore(b);
        }
        return 0;
      });
  }, [reviews, search, ratingFilter, sortBy]);

  // Delete review handler
  const handleDelete = async () => {
    if (!deletingId) return;
    setIsDeleting(true);
    try {
      const res = await fetch(`/api/admin/reviews?id=${deletingId}`, {
        method: 'DELETE',
        headers: adminHeaders(),
      });
      if (res.ok) {
        setReviews((prev) => prev.filter((r) => r.id !== deletingId));
        setDeletingId(null);
      } else {
        alert('Failed to delete review');
      }
    } catch (err) {
      console.error('Error deleting review:', err);
      alert('An error occurred while deleting');
    } finally {
      setIsDeleting(false);
    }
  };

  // Export CSV Handler
  const handleExportCSV = () => {
    if (filteredReviews.length === 0) {
      alert('No reviews to export');
      return;
    }

    const headers = [
      'ID',
      'Name',
      'Phone',
      'Overall Rating',
      'Quality',
      'Durability',
      'Shape',
      'Packaging',
      'Delivery Time',
      'Delivery Speed',
      'Shipping Company',
      'Created At',
    ];

    const rows = filteredReviews.map((r) => [
      r.id,
      `"${r.name.replace(/"/g, '""')}"`,
      `"${r.phone}"`,
      calculateOverallScore(r),
      r.quality,
      r.durability,
      r.shape,
      r.packaging,
      r.delivery_time,
      r.delivery_speed,
      r.shipping_company,
      new Date(r.created_at).toLocaleString(),
    ]);

    const csvContent =
      'data:text/csv;charset=utf-8,' +
      [headers.join(','), ...rows.map((e) => e.join(','))].join('\n');

    const encodedUri = encodeURI(csvContent);
    const link = document.createElement('a');
    link.setAttribute('href', encodedUri);
    link.setAttribute(
      'download',
      `seasons_reviews_${new Date().toISOString().slice(0, 10)}.csv`
    );
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  return (
    <AdminLayout>
      <div className={styles.container}>
        {/* Header */}
        <header className={styles.header}>
          <div>
            <h1>Customer Reviews & Ratings</h1>
            <p>Monitor post-purchase feedback and detailed customer evaluations.</p>
          </div>
          <button className={styles.exportBtn} onClick={handleExportCSV}>
            <Download size={16} /> Export CSV
          </button>
        </header>

        {/* Stats Grid */}
        <div className={styles.statsGrid}>
          <div className={styles.statCard}>
            <div className={`${styles.statIcon} ${styles.goldIcon}`}>
              <MessageSquare size={24} />
            </div>
            <div className={styles.statInfo}>
              <h3>Total Reviews</h3>
              <div className={styles.statValue}>{stats.total}</div>
            </div>
          </div>

          <div className={styles.statCard}>
            <div className={`${styles.statIcon} ${styles.starIcon}`}>
              <Star size={24} />
            </div>
            <div className={styles.statInfo}>
              <h3>Overall Rating</h3>
              <div className={styles.statValue}>{stats.overallAvg} / 5</div>
            </div>
          </div>

          <div className={styles.statCard}>
            <div className={`${styles.statIcon} ${styles.purpleIcon}`}>
              <Award size={24} />
            </div>
            <div className={styles.statInfo}>
              <h3>Quality Avg</h3>
              <div className={styles.statValue}>{stats.qualityAvg} / 5</div>
            </div>
          </div>

          <div className={styles.statCard}>
            <div className={`${styles.statIcon} ${styles.blueIcon}`}>
              <Package size={24} />
            </div>
            <div className={styles.statInfo}>
              <h3>Packaging Avg</h3>
              <div className={styles.statValue}>{stats.packagingAvg} / 5</div>
            </div>
          </div>

          <div className={styles.statCard}>
            <div className={`${styles.statIcon} ${styles.greenIcon}`}>
              <Truck size={24} />
            </div>
            <div className={styles.statInfo}>
              <h3>Delivery Speed Avg</h3>
              <div className={styles.statValue}>{stats.deliverySpeedAvg} / 5</div>
            </div>
          </div>
        </div>

        {/* Controls Bar */}
        <div className={styles.controlsBar}>
          <div className={styles.searchAndSort}>
            <div className={styles.searchBox}>
              <Search size={18} />
              <input
                type="text"
                placeholder="Search by customer name or phone..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                className={styles.searchInput}
              />
            </div>
            <select
              value={sortBy}
              onChange={(e) => setSortBy(e.target.value as typeof sortBy)}
              className={styles.sortSelect}
            >
              <option value="newest">Sort by Newest</option>
              <option value="oldest">Sort by Oldest</option>
              <option value="highest">Sort by Highest Rated</option>
              <option value="lowest">Sort by Lowest Rated</option>
            </select>
          </div>

          <div className={styles.filterPills}>
            <span className={styles.filterLabel}>Rating Filter:</span>
            <button
              className={`${styles.pillBtn} ${ratingFilter === 'all' ? styles.pillBtnActive : ''}`}
              onClick={() => setRatingFilter('all')}
            >
              All Ratings
            </button>
            <button
              className={`${styles.pillBtn} ${ratingFilter === '5' ? styles.pillBtnActive : ''}`}
              onClick={() => setRatingFilter('5')}
            >
              5 Stars ★
            </button>
            <button
              className={`${styles.pillBtn} ${ratingFilter === '4' ? styles.pillBtnActive : ''}`}
              onClick={() => setRatingFilter('4')}
            >
              4 Stars ★
            </button>
            <button
              className={`${styles.pillBtn} ${ratingFilter === '3' ? styles.pillBtnActive : ''}`}
              onClick={() => setRatingFilter('3')}
            >
              3 Stars ★
            </button>
            <button
              className={`${styles.pillBtn} ${ratingFilter === 'low' ? styles.pillBtnActive : ''}`}
              onClick={() => setRatingFilter('low')}
            >
              Needs Attention (≤ 2.5★)
            </button>
          </div>
        </div>

        {/* Reviews Table */}
        <div className={styles.tableWrapper}>
          {loading ? (
            <div className={styles.emptyState}>
              <Loader2 className="animate-spin" size={32} />
              <p>Loading reviews...</p>
            </div>
          ) : filteredReviews.length === 0 ? (
            <div className={styles.emptyState}>
              <Sparkles size={36} />
              <p>No customer reviews found matching criteria.</p>
            </div>
          ) : (
            <table className={styles.table}>
              <thead>
                <tr>
                  <th>Customer</th>
                  <th>Phone</th>
                  <th>Overall Score</th>
                  <th>Quality</th>
                  <th>Packaging</th>
                  <th>Delivery</th>
                  <th>Submitted At</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {filteredReviews.map((r) => {
                  const score = calculateOverallScore(r);
                  let scoreBadgeClass = styles.starMedium;
                  if (score >= 4.0) scoreBadgeClass = styles.starHigh;
                  if (score <= 2.5) scoreBadgeClass = styles.starLow;

                  return (
                    <tr key={r.id}>
                      <td>
                        <div className={styles.customerName}>{r.name}</div>
                      </td>
                      <td>
                        <span className={styles.customerPhone}>{r.phone}</span>
                      </td>
                      <td>
                        <span className={`${styles.ratingBadge} ${scoreBadgeClass}`}>
                          <Star size={14} fill="currentColor" />
                          {score} / 5
                        </span>
                      </td>
                      <td>{r.quality} / 5</td>
                      <td>{r.packaging} / 5</td>
                      <td>{r.delivery_speed} / 5</td>
                      <td>{new Date(r.created_at).toLocaleDateString()}</td>
                      <td>
                        <div className={styles.actions}>
                          <button
                            className={styles.viewBtn}
                            onClick={() => setSelectedReview(r)}
                            title="View granular scores"
                          >
                            <Eye size={15} /> View
                          </button>
                          <button
                            className={styles.deleteBtn}
                            onClick={() => setDeletingId(r.id)}
                            title="Delete review"
                          >
                            <Trash2 size={15} />
                          </button>
                        </div>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          )}
        </div>

        {/* Detailed Scores Modal */}
        {selectedReview && (
          <div className={styles.modalOverlay} onClick={() => setSelectedReview(null)}>
            <div className={styles.modalContent} onClick={(e) => e.stopPropagation()}>
              <div className={styles.modalHeader}>
                <h2>Review Details & Breakdown</h2>
                <button className={styles.closeBtn} onClick={() => setSelectedReview(null)}>
                  <X size={20} />
                </button>
              </div>

              <div className={styles.modalBody}>
                <div className={styles.customerMeta}>
                  <div>
                    <p><strong>Customer Name:</strong> {selectedReview.name}</p>
                    <p><strong>Phone Number:</strong> {selectedReview.phone}</p>
                  </div>
                  <div>
                    <p><strong>Submitted Date:</strong> {new Date(selectedReview.created_at).toLocaleString()}</p>
                    <p><strong>Overall Score:</strong> {calculateOverallScore(selectedReview)} / 5</p>
                  </div>
                </div>

                <div className={styles.scoreGrid}>
                  <div className={styles.scoreItem}>
                    <span className={styles.scoreLabel}>Product Quality</span>
                    <span className={styles.scoreValue}>
                      <Star size={14} fill="#eab308" color="#eab308" />
                      {selectedReview.quality} / 5
                    </span>
                  </div>

                  <div className={styles.scoreItem}>
                    <span className={styles.scoreLabel}>Durability</span>
                    <span className={styles.scoreValue}>
                      <Star size={14} fill="#eab308" color="#eab308" />
                      {selectedReview.durability} / 5
                    </span>
                  </div>

                  <div className={styles.scoreItem}>
                    <span className={styles.scoreLabel}>Shape & Fit</span>
                    <span className={styles.scoreValue}>
                      <Star size={14} fill="#eab308" color="#eab308" />
                      {selectedReview.shape} / 5
                    </span>
                  </div>

                  <div className={styles.scoreItem}>
                    <span className={styles.scoreLabel}>Packaging</span>
                    <span className={styles.scoreValue}>
                      <Star size={14} fill="#eab308" color="#eab308" />
                      {selectedReview.packaging} / 5
                    </span>
                  </div>

                  <div className={styles.scoreItem}>
                    <span className={styles.scoreLabel}>Delivery Time</span>
                    <span className={styles.scoreValue}>
                      <Star size={14} fill="#eab308" color="#eab308" />
                      {selectedReview.delivery_time} / 5
                    </span>
                  </div>

                  <div className={styles.scoreItem}>
                    <span className={styles.scoreLabel}>Delivery Speed</span>
                    <span className={styles.scoreValue}>
                      <Star size={14} fill="#eab308" color="#eab308" />
                      {selectedReview.delivery_speed} / 5
                    </span>
                  </div>

                  <div className={styles.scoreItem} style={{ gridColumn: 'span 2' }}>
                    <span className={styles.scoreLabel}>Shipping Company Rating</span>
                    <span className={styles.scoreValue}>
                      <Star size={14} fill="#eab308" color="#eab308" />
                      {selectedReview.shipping_company} / 5
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Delete Confirmation Modal */}
        {deletingId && (
          <div className={styles.modalOverlay} onClick={() => setDeletingId(null)}>
            <div className={styles.modalContent} onClick={(e) => e.stopPropagation()}>
              <div className={styles.modalHeader}>
                <h2>Confirm Review Deletion</h2>
                <button className={styles.closeBtn} onClick={() => setDeletingId(null)}>
                  <X size={20} />
                </button>
              </div>

              <div className={styles.confirmDeleteBox}>
                <p>Are you sure you want to delete this customer review? This action cannot be undone.</p>
                <div className={styles.confirmActions}>
                  <button
                    className={styles.confirmBtn}
                    onClick={handleDelete}
                    disabled={isDeleting}
                  >
                    {isDeleting ? 'Deleting...' : 'Yes, Delete Review'}
                  </button>
                  <button
                    className={styles.cancelBtn}
                    onClick={() => setDeletingId(null)}
                    disabled={isDeleting}
                  >
                    Cancel
                  </button>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </AdminLayout>
  );
}
