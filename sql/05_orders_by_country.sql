-- ======================================================
-- 05_orders_by_country.sql
-- ======================================================
-- Orders by Country
--
-- Purpose:
--   - Measure geographic distribution of order volume
--   - Identify countries contributing the most orders
--
-- Definitions:
--   - Orders: COUNT(DISTINCT orders.order_id)
--
-- Methodology:
--   - Country is sourced from users.country
--   - Orders are attributed to the user's country at
--     the time of the order
--   - INNER JOIN excludes orders with missing users
--
-- Data scope:
--   - Orders created between 2022-01-01 and 2025-12-30
-- ======================================================

SELECT
  u.country,
  COUNT(DISTINCT o.order_id) AS orders
FROM orders o
JOIN users u
  ON o.user_id = u.user_id
WHERE o.created_at BETWEEN '2022-01-01' AND '2025-12-30'
GROUP BY u.country
ORDER BY orders DESC;
