-- 02_revenue_trends.sql
-- ======================================================
-- Monthly Revenue Trends
--
-- Purpose:
--   - Compute monthly revenue, order volume, and AOV
--   - Support high-level business trend analysis
--
-- Definitions:
--   - Revenue: SUM(order_items.sale_price)
--   - Orders: COUNT(DISTINCT orders.order_id)
--   - AOV: Revenue / number of orders
--
-- Methodology:
--   - Revenue is aggregated at the order_items grain
--   - INNER JOIN excludes orders with no line items
--   - Order month is derived from orders.created_at
--
-- Data scope:
--   - Orders created between 2022-01-01 and 2025-12-30
-- ======================================================

SELECT
  DATE_FORMAT(o.created_at, '%Y-%m-01') AS month,
  SUM(oi.sale_price) AS revenue,
  COUNT(DISTINCT o.order_id) AS orders,
  SUM(oi.sale_price) / COUNT(DISTINCT o.order_id) AS aov
FROM orders o
JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE o.created_at BETWEEN '2022-01-01' AND '2025-12-30'
GROUP BY 1
ORDER BY 1;

 





