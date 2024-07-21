# Write your MySQL query statement below
# pay attention to the where condition (should be outside rather than inside)
select stock_name, sum(sell_price - buy_price) as capital_gain_loss
from (
    select stock_name, operation, price as buy_price, lead(price) over (partition by stock_name order by operation_day) as sell_price
    from Stocks
) g
where operation = "buy"
group by stock_name
