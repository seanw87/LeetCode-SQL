# Write your MySQL query statement below
select person_name
from (
    select person_name, 
        sum(weight) over (order by turn) as accumulated_weight
    from Queue
) g1
where accumulated_weight <= 1000
order by accumulated_weight desc
limit 1