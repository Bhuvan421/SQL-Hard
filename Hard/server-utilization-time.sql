## Question: 
  ## Amazon -> https://datalemur.com/questions/total-utilization-time


## Solution:

-- SELECT * FROM server_utilization

-- so, looking at the question, we need to get the diff in timestamps on days:
-- Thus, we need to use `justify_hours()`
-- Also, we should add all rows on justify_hours to get total uptime. 
-- Finally, we only need days, so we need to use `Date_Part()` to remove any left over hours.

-----------------------------------------------------------------------------------------------------------------------

-- putting each step in seperate CTE's:

with running_time as 
(
  select 
    server_id, 
    session_status, 
    status_time as start_time, 
    lead(status_time) over(partition by server_id order by status_time) as stop_time 
  from 
    server_utilization 
), 
days_diff as 
(
  select 
    *, 
    justify_hours(stop_time - start_time) as diff 
  from running_time
), 
final_days as 
(
select 
  justify_hours(sum(diff)::interval) as total_days 
from 
  days_diff
where 
  session_status = 'start'
)
select 
  date_part('days', total_days) as total_uptime_days 
from final_days


---------------------------------------------------------------------------------------------------------------------
-- Clean solution with one cte:

WITH running_time AS 
(
  SELECT
    server_id,
    session_status,
    status_time AS start_time,
    LEAD(status_time) OVER (PARTITION BY server_id ORDER BY status_time) AS stop_time
  FROM server_utilization
)
SELECT
  DATE_PART('days', JUSTIFY_HOURS(SUM(stop_time - start_time))) AS total_uptime_days
FROM 
  running_time
WHERE 
  session_status = 'start'




