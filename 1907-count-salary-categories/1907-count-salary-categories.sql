# Write your MySQL query statement below
select g1.category, if(g2.accounts_count is null, 0, g2.accounts_count) as accounts_count
from (
    select 'Low Salary' as category
    UNION
    select 'Average Salary' as category
    UNION
    select 'High Salary' as category
) g1
left join (
    select category, count(1) as accounts_count
    from (
        select account_id,
            CASE WHEN income < 20000 THEN 'Low Salary'
                WHEN income between 20000 and 50000 THEN 'Average Salary'
                WHEN income > 50000 THEN 'High Salary' END
            as category
        FROM Accounts
    ) g
    group by category
) g2
on g1.category = g2.category