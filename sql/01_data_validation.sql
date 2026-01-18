-- 01_data_validation.sql
-- ======================================================
-- Data Validation: thelook_ecommerce
--
-- Purpose:
--   - Basic sanity checks on table sizes
--   - Verify temporal coverage of orders
--   - Identify potential referential integrity issues
--
-- Notes:
--   - Some anomalies (e.g. orphan orders) may be expected
--     due to upstream filtering decisions in ETL
-- ======================================================


-- ------------------------------------------------------
-- Row counts per table
-- Purpose:
--   - Confirm tables are populated
--   - Provide scale/context for downstream analysis
-- ------------------------------------------------------
SELECT COUNT(*) AS users_count FROM users;
SELECT COUNT(*) AS orders_count FROM orders;
SELECT COUNT(*) AS order_items_count FROM order_items;
SELECT COUNT(*) AS products_count FROM products;


-- ------------------------------------------------------
-- Orders date range
-- Purpose:
--   - Verify temporal coverage of the orders table
--   - Identify earliest and latest order timestamps
-- ------------------------------------------------------
SELECT
  MIN(created_at) AS first_order_date,
  MAX(created_at) AS last_order_date
FROM orders;


-- ------------------------------------------------------
-- Orphan orders
-- Definition:
--   - Orders whose user_id has no matching record in users
--
-- Expected behavior:
--   - Ideally zero in a fully consistent dataset
--   - Non-zero values may occur if users were filtered
--     upstream (e.g. by created_at) during data preparation
-- ------------------------------------------------------
SELECT COUNT(*) AS orphan_orders
FROM orders o
LEFT JOIN users u
  ON o.user_id = u.user_id
WHERE u.user_id IS NULL;


-- ------------------------------------------------------
-- Orders without order items
-- Definition:
--   - Orders that have no associated rows in order_items
--
-- Expected behavior:
--   - Ideally zero for completed/valid orders
--   - A small non-zero count may exist due to cancelled,
--     failed, or incomplete orders retained in the dataset
-- ------------------------------------------------------
SELECT COUNT(*) AS orders_without_items
FROM orders o
LEFT JOIN order_items oi
  ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;
