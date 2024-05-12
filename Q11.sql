-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pt.category,round(SUM(od.quantity * p.price)/(SELECT 
    ROUND(SUM(od.quantity * p.price), 2) 
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id)*100,2) AS total_sales
FROM order_details od join pizzas p
on od.pizza_id=p.pizza_id join pizza_types pt
on pt.pizza_type_id=p.pizza_type_id
 group by pt.category
 order by total_sales desc	
 ;