# Write your MySQL query statement below
select product_id, price
from (
    select product_id, 
        if(daydiff < 0, 10, new_price) as price, 
        row_number() over (partition by product_id order by if(daydiff<0, 10000+daydiff, daydiff)) as price_order
    from (
        select product_id, 
            new_price, 
            datediff("2019-08-16", change_date) as daydiff
        from Products
    ) g1
) g2
where price_order = 1