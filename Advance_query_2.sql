-- Advance
-- 2) Analyze the cumulative revenue generated over time


select order_date, revenue, round(sum(revenue) 
over(order by order_date),2) as cum_revenue from
(SELECT 
    orders.order_date,
    ROUND(SUM(pizzas.price * orders_details.quantity),
            2) AS revenue
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
        JOIN
    orders ON orders.order_id = orders_details.order_id
GROUP BY orders.order_date) as sales;