-- Basic:
-- 1) Retrieve the total number of orders placed.

SELECT 
    COUNT(order_id) AS total_orders
FROM
    pizzahut.orders;