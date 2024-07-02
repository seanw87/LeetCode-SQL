# Write your MySQL query statement below
select name
from (
    select a.id, a.name, b.id as eid, b.name as ename
    from Employee a 
    join Employee b 
    on a.id = b.managerID
) g
group by id, name
having count(distinct eid) >= 5