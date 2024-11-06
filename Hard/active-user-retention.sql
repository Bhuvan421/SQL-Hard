## Question:
  ## Facebook [Meta] -> https://datalemur.com/questions/user-retention


## Solution:

-- SELECT 
-- extract(month from event_date) as month, 
-- count(distinct user_id) as monthly_active_users 
-- FROM user_actions
-- where extract(month from event_date) = '06'
-- group by event_date

-- with act as (
-- select *, extract(month from event_date) as activemonth
-- from user_actions 
-- ),
-- usercount as 
-- (
-- select user_id
-- from act 
-- where activemonth in ('6', '7') 
-- group by user_id 
-- having count(distinct user_id) = 2
-- )
-- select activemonth, count(user_id) 
-- from usercount
-- group by activemonth


with june as (
select *, extract(month from event_date) as activemonth 
from user_actions 
where extract(month from event_date) = '6'
), 
july as (
select *, extract(month from event_date) as activemonth 
from user_actions 
where extract(month from event_date) = '7'
)
select july.activemonth, count(distinct july.user_id)
from june join july 
on june.user_id = july.user_id
group by july.activemonth



