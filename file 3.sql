#Identify the highest-priced pizza.
SELECT 
    pt.name AS pizza_name, p.price
FROM
    pizzas p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;