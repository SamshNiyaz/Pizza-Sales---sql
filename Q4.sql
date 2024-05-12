-- Identify the most common pizza size ordered.

SELECT 
    p.size, COUNT(od.quantity) AS total
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total DESC
LIMIT 1;