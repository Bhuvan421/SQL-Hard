## Question: 
  ## Stripe -> https://datalemur.com/questions/repeated-payments


## Solution:

-- SELECT * FROM transactions;

with summary as
(
  select 
    *, 
    lead(transaction_timestamp) over(partition by credit_card_id, merchant_id, amount order by transaction_timestamp) as t
  from 
    transactions
), 
diff as 
(
  select 
    floor(extract(epoch from t - transaction_timestamp) / 60) as diff 
  from 
    summary 
  where 
    t is not null
)
select 
  count(*) as payment_count
from 
  diff
where 
  diff <= 10

