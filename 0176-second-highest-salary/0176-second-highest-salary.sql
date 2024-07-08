# Write your MySQL query statement below
# pay attention to the scenario of same salaries (dense_rank and limit 1 achieve the purpose)
select salary as SecondHighestSalary
from (
    select id, salary, dense_rank() over (order by salary desc) as salary_row
    from (
        select id, salary from Employee
        union all
        select (select max(id) from Employee) + 1 as id, null as salary
    ) a
) b
where salary_row = 2
limit 1