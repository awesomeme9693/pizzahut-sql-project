SELECT 
    size, COUNT(*) AS size_count
FROM
    pizzas p
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY size
ORDER BY size_count DESC
LIMIT 1;