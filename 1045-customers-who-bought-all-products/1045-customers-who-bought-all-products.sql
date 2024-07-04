# Write your MySQL query statement below
select customer_id
from (
    select customer_id, count(distinct product_key) as product_num
    from Customer
    group by customer_id
) g
where product_num in (select count(1) as c from Product)