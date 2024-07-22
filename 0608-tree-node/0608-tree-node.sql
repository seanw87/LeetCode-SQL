# Write your MySQL query statement below
select id, type
from (
    select a.id, 
        case 
            when a.p_id is null then "Root"
            when b.id is null then "Leaf"
            when b.id is not null then "Inner"
        end as type
    from Tree a
    left join Tree b
    on a.id = b.p_id
) g
group by g.id, g.type