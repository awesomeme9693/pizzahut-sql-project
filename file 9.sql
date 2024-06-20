#Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(daily_orders.total_pizzas), 0) AS avg_pizzas_per_day
FROM
    (SELECT 
        order_date, SUM(quantity) AS total_pizzas
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY order_date) daily_orders;