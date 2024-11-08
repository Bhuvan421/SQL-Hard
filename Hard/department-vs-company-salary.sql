## Question: 
  ## Stripe -> https://datalemur.com/questions/sql-department-company-salary-comparison


## Solution:

-- SELECT * FROM employee LIMIT 5;

with march_salary as 
(
  select 
    employee_id, 
    amount, 
    to_char(payment_date, 'MM-YYYY') as sal_month
  from 
    salary
), 
summary as 
(
  select 
    e.department_id, 
    s.amount, 
    s.sal_month 
  from 
    employee e 
  join 
    march_salary s
  on
    e.employee_id = s.employee_id
  where 
    sal_month = '03-2024'
), 
overall_avg_sal as 
(
  select 
    SUM(amount)/COUNT(DISTINCT department_id) as overall_avg
  from 
    summary
)
select 
  department_id, 
  sal_month as payment_date, 
  CASE
    when sum(amount) < (select overall_avg from overall_avg_sal) then 'lower'
    when sum(amount) = (select overall_avg from overall_avg_sal) then 'same' 
    else 'higher'
  end as comparison
from 
  summary  
group by 
  department_id, 
  sal_month
order by 
  department_id





  
