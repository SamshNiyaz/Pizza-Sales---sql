-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.name,SUM(od.quantity * p.price) AS total_sales
FROM order_details od join pizzas p
on od.pizza_id=p.pizza_id join pizza_types pt
on pt.pizza_type_id=p.pizza_type_id
 group by pt.name
 order by total_sales desc
 limit 3;