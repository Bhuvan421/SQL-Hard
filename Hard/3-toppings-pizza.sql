## Question: 
  ## Mckinsey -> https://datalemur.com/questions/pizzas-topping-cost


## Solution:

--> Using cross join

-- select * from pizza_toppings
-- SELECT count(distinct(topping_name)) FROM pizza_toppings

select 
  concat(p1.topping_name , ',' , p2.topping_name , ',' , p3.topping_name) as pizza, 
  (p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost) as total_cost
from 
  pizza_toppings p1
  cross join 
  pizza_toppings p2
  cross join 
  pizza_toppings p3 
where 
  -- p1.topping_name != p2.topping_name and  
  -- p2.topping_name != p3.topping_name and 
  -- p3.topping_name != p1.topping_name
  p1.topping_name < p2.topping_name 
  AND p2.topping_name < p3.topping_name
order by 
  total_cost desc, 
  pizza


-----------------------------------------------------------------------------------------------------
  
--> Using inner join

SELECT 
  CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
  p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM pizza_toppings AS p1
INNER JOIN pizza_toppings AS p2
  ON p1.topping_name < p2.topping_name 
INNER JOIN pizza_toppings AS p3
  ON p2.topping_name < p3.topping_name 
ORDER BY total_cost DESC, pizza;

