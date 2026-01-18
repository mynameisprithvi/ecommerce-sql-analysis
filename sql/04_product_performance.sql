-- 04_product_performance.sql
-- ======================================================
-- Product Performance Analysis by Category
--
-- Purpose:
--   - Identify product categories contributing most to revenue
--   - Compare revenue generation against order volume by category
--
-- Definitions:
--   - Revenue: SUM(order_items.sale_price)
--   - Orders: COUNT(DISTINCT orders.order_id)
--
-- Methodology:
--   - Revenue is aggregated at the order_items grain
--   - Order attribution (time filtering) is based on orders.created_at
--   - INNER JOINs ensure only valid orders and products are included
--
-- Data scope:
--   - Orders created between 2022-01-01 and 2025-12-30
-- ======================================================

SELECT
  p.category,
  SUM(oi.sale_price) AS revenue,
  COUNT(DISTINCT o.order_id) AS orders
FROM order_items oi
JOIN orders o
  ON oi.order_id = o.order_id
JOIN products p
  ON oi.product_id = p.product_id
WHERE o.created_at BETWEEN '2022-01-01' AND '2025-12-30'
GROUP BY p.category
ORDER BY revenue DESC;
