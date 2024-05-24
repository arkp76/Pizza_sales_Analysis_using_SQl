-- Advance
-- 3) Determine the top 3 most ordered pizza types based 
--     on revenue for each pizza category.


select category, name, revenue from
(select category, name, revenue,
rank() over(partition by category order by revenue DESC) 
as rn from
(SELECT 
    pizza_types.category,
    pizza_types.name,
    SUM(pizzas.price * orders_details.quantity) AS revenue
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.category , pizza_types.name) as a) as b
where rn <=3;