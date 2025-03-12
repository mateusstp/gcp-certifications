-- Sample queries to test pgAudit

-- Query 1: Summary of orders by users
SELECT
    users.id  AS users_id,
    users.first_name  AS users_first_name,
    users.last_name  AS users_last_name,
    COUNT(DISTINCT order_items.order_id ) AS order_items_order_count,
    COALESCE(SUM(order_items.sale_price ), 0) AS order_items_total_revenue
FROM order_items
LEFT JOIN users ON order_items.user_id = users.id
GROUP BY 1, 2, 3
ORDER BY 4 DESC
LIMIT 500;

-- Query 2: Summary by individual product
-- Replace with your actual query for summary by individual product

-- Query 3: Orders by distribution center
-- Replace with your actual query for orders by distribution center
