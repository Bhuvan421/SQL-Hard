## Question: 
  ## Google -> https://datalemur.com/questions/median-search-freq



## Solution:

-- SELECT * FROM search_frequency;


with user_distribution as 
(
  SELECT 
    searches, 
    row_number() over(order by searches) as user_order
  FROM 
    search_frequency
  GROUP BY 
    searches, 
    GENERATE_SERIES(1, num_users)
), 
order_stats as 
(
select 
  max(user_order) as max_order, 
  min(user_order) as min_order
from 
  user_distribution
)
SELECT
  case 
    when max_order % 2 = 0 then 
    (select round(avg(searches), 1) 
      from user_distribution 
      where user_order = floor((max_order + min_order) / 2.0) 
      or user_order = ceil((max_order + min_order) / 2.0))
    else 
    (select searches 
      from user_distribution 
      where user_order = (max_order + min_order) / 2.0)
  end as median 
from 
  order_stats


