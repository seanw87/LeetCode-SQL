# Write your MySQL query statement below
select buyer_id, join_date, count(order_id) as orders_in_2019
from (
    select a.order_id, b.user_id as buyer_id, b.join_date
    from (
        select order_id, buyer_id
        from Orders
        where date_format(order_date, "%Y") = 2019
    ) a right join Users b
    on a.buyer_id = b.user_id
) g
group by buyer_id, join_date
