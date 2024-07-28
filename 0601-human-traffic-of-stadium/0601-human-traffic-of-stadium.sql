# Write your MySQL query statement below

select g1.id, g1.visit_date, g1.people
from (
    select id-rn as idiff, id, visit_date, people
    from (
        select id, visit_date, people, cast(row_number() over (order by id) as SIGNED) as rn
        from Stadium
        where people >= 100
    ) a 
) g1
inner join (
    select distinct idiff
    from (
        select id-rn as idiff, id, visit_date, people
        from (
            select id, visit_date, people, cast(row_number() over (order by id) as SIGNED) as rn
            from Stadium
            where people >= 100
        ) a 
    ) b
    group by idiff
    having count(1) >= 3
) g2
on g1.idiff = g2.idiff