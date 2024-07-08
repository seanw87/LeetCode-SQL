# Write your MySQL query statement below
# select if(salary='', null, salary) as SecondHighestSalary
# from (
#     select id, salary, row_number() over (order by salary) as salary_row
#     from Employee
# ) a 
# where salary_row = 2

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