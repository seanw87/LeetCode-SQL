# Write your MySQL query statement below
select user_id, round(sum(act)/count(act), 2) as confirmation_rate
from (
    select a.user_id, case when b.action = 'confirmed' then 1 else 0 end as act
    from Signups a
    left join Confirmations b
    on a.user_id = b.user_id
) g
group by user_id