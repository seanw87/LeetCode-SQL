# Write your MySQL query statement below
select visited_on, amount, round(average_amount, 2) as average_amount
from (
    select *, row_number() over (order by visited_on) as idx
    from (
        select visited_on, 
            sum(amount) over (order by visited_on rows between 6 preceding and 0 following) as amount,
            avg(amount) over (order by visited_on rows between 6 preceding and 0 following) as average_amount
        from (
            select visited_on, sum(amount) as amount
            from Customer
            group by visited_on
        ) g1
    ) g2
) g3
where idx >= 7