## Question:
  ## Wayfair -> https://datalemur.com/questions/yoy-growth-rate


## Solution:

-- SELECT * FROM user_transactions;

-- select 
--   extract(year from transaction_date) as year, 
--   product_id, 
--   sum(spend) as spend 
-- from user_transactions
-- group by year, product_id
-- order by year

with yearly_spend as 
(
  select 
    extract(year from transaction_date) as year, 
    product_id, 
    spend as curr_year_spend, 
    lag(spend, 1) over(partition by product_id order by extract(year from transaction_date)) as prev_year_spend 
  from user_transactions
)
select 
  year, product_id, curr_year_spend, prev_year_spend, 
  round(((curr_year_spend - prev_year_spend) / prev_year_spend) * 100, 2) as yoy_rate 
from yearly_spend




