#Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pr.name,
    pr.pizza_rev,
    ROUND((pr.pizza_rev / tr.total_rev) * 100, 2) AS percentage_contribution
FROM
    (SELECT 
        pt.name, SUM(od.quantity * p.price) AS pizza_rev
    FROM
        order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.name) pr,
    (SELECT 
        SUM(od.quantity * p.price) AS total_rev
    FROM
        order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id) tr
ORDER BY percentage_contribution DESC;