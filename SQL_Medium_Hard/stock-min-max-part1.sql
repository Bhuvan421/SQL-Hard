## Question: 
  ## Bloomberg -> https://datalemur.com/questions/sql-bloomberg-stock-min-max-1


## Solution:

with highestOpen as 
(
  select 
    ticker, 
    to_char(date, 'Mon-YYYY') as highest_mth, 
    max(open) as highest_open, 
    row_number() over(partition by ticker order by max(open) desc) as high_rank
  from 
    stock_prices 
  group by 
    ticker, date
), 
lowestOpen as 
(
  select 
    ticker, 
    to_char(date, 'Mon-YYYY') as lowest_mth, 
    min(open) as lowest_open, 
    row_number() over(partition by ticker order by min(open)) as low_rank 
  from 
    stock_prices 
  group by 
    ticker, date
)

select 
  ho.ticker, 
  highest_mth, 
  highest_open, 
  lowest_mth, 
  lowest_open 
from 
  highestOpen ho inner join lowestOpen lo 
  on ho.ticker = lo.ticker 
where 
  ho.high_rank = 1 and lo.low_rank = 1
order by 
  ho.ticker
