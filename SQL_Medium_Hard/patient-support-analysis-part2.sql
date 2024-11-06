## Question: 
  ## United Health -> https://datalemur.com/questions/uncategorized-calls-percentage

  
## Solution:

-- SELECT count(*) FROM callers;

-- select distinct call_category from callers

-- select count(*) from callers where call_category = 'n/a' or call_category is null 

with totalCount as 
(
  SELECT count(*) as t FROM callers
),
uncatCount as 
(
  select count(*) as ut from callers where call_category = 'n/a' or call_category is null 
)

select 
  round(((select ut::numeric from uncatCount) / (select t from totalCount)) * 100, 1) as uncategorized_call_pct
