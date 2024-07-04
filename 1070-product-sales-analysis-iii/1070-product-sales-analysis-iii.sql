# Write your MySQL query statement below
# Here using row_number() will be wrong because it seems that for a specific product_id and year, there will be multiple sale_id, and the result doesn't want them to be merged(which needs to be confirmed with the questioner)
select product_id, 
    `year` as first_year, 
    quantity, 
    price
from (
    select *, 
        rank() over (partition by product_id order by `year`) as year_order
    from Sales
) g
where year_order=1