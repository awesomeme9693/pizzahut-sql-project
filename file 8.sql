#Join relevant tables to find the category-wise distribution/selling of pizzas.
SELECT 
    pt.category, COUNT(od.order_details_id) AS order_count
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY order_count DESC;