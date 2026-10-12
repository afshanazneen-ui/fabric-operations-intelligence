-- Starter SQL checks. Adapt syntax and identifiers to the SQL endpoint/warehouse you use.
-- Run only after the named tables exist. Save observed outputs in tests/results/.

-- 1. Duplicate order identifiers
SELECT order_id, COUNT(*) AS row_count
FROM GoldOrders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 2. Missing required order identifiers
SELECT COUNT(*) AS missing_order_id_rows
FROM GoldOrders
WHERE order_id IS NULL;

-- 3. Non-positive quantities
SELECT *
FROM GoldOrderItems
WHERE quantity <= 0;

-- 4. Order value at the order grain
SELECT COUNT(*) AS order_count,
       SUM(order_value) AS total_order_value
FROM GoldOrders;

-- Important: do not join GoldOrders directly to multiple delivery-event rows and then sum order_value.
