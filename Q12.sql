-- Analyze the cumulative revenue generated over time.
select order_date,round(sum(revenue) over(order by order_date),2) as cum_rev from
(select o.order_date,sum(od.quantity*p.price) as revenue from order_details as od join pizzas p
on od.pizza_id=p.pizza_id join orders o on
od.order_id=o.order_id
group by order_date) tot_sales;