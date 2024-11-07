## Question: 
  ## Meta -> https://datalemur.com/questions/updated-status


  
## Solution:

-- SELECT * FROM advertiser
-- select * from daily_pay

with cte as 
(
  select 
    ad.user_id as ad_user, 
    ad.status, 
    dp.user_id as paid_user 
  from 
    advertiser ad 
  FULL OUTER JOIN 
    daily_pay dp
  on 
    ad.user_id = dp.user_id
)
select 
  coalesce(ad_user, paid_user) as user_id, 
  case 
    when paid_user is null then 'CHURN' 
    when status = 'NEW' or status = 'EXISTING' or status = 'RESURRECT' then 'EXISTING' 
    when status = 'CHURN' then 'RESURRECT' 
    when status is NULL then 'NEW'
  end as new_status 
from 
  cte
order by 
  user_id




