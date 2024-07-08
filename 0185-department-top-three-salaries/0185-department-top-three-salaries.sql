# Write your MySQL query statement below
select b.name as Department, a.name as Employee, a.salary as Salary
from (
    select *
    from (
        select id, name, departmentId, salary, dense_rank() over (partition by departmentId order by salary desc) as salary_rank
        from Employee
    ) g
    where salary_rank <= 3
) a left join Department b
on a.departmentId = b.id