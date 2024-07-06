# Write your MySQL query statement below
select id, student
from (
    select if(id=(select max(id) from Seat), id, id+1) as id, student
    from Seat
    where id % 2 = 1
    union all
    select id-1 as id, student
    from Seat
    where id % 2 = 0
) g
order by id