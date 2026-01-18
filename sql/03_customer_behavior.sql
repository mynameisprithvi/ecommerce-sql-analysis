-- 03_customer_behavior.sql
-- ======================================================
-- Customer Behavior: New vs Returning Customers
--
-- Purpose:
--   - Classify orders as coming from new or returning users
--   - Measure order volume and revenue by customer type
--
-- Definitions:
--   - New customer:
--       An order whose created_at equals the user's first-ever
--       recorded order date in the dataset
--   - Returning customer:
--       Any order placed after the user's first order
--
-- Methodology:
--   - First order date is computed per user across the full
--     orders table (no date filtering applied)
--   - Classification is performed at the order level
--   - Revenue is aggregated from order_items
--   - INNER JOIN excludes orders without line items
--
-- Data scope:
--   - Orders created between 2022-01-01 and 2025-12-30
-- ======================================================

SELECT
  DATE_FORMAT(o.created_at, '%Y-%m-01') AS month,
  CASE
    WHEN o.created_at = f.first_order_date THEN 'new'
    ELSE 'returning'
  END AS customer_type,
  COUNT(DISTINCT o.order_id) AS orders,
  SUM(oi.sale_price) AS revenue
FROM orders o
JOIN (
  SELECT
    user_id,
    MIN(created_at) AS first_order_date
  FROM orders
  GROUP BY user_id
) f
  ON o.user_id = f.user_id
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE o.created_at BETWEEN '2022-01-01' AND '2025-12-30'
GROUP BY month, customer_type
ORDER BY month, customer_type;
