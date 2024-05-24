-- Advanced:
-- 1) Calculate the percentage contribution of each 
--    pizza type to total revenue.


SELECT 
    pizza_types.category,
    round((SUM(pizzas.price * orders_details.quantity) / (SELECT 
            SUM(pizzas.price * orders_details.quantity)
        FROM
            pizzas
                JOIN
            orders_details ON pizzas.pizza_id = orders_details.pizza_id)) * 100,2) AS rev_percentage
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.category
ORDER BY rev_percentage DESC;