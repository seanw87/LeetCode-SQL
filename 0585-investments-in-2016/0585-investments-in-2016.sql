# Write your MySQL query statement below
select round(sum(a.tiv_2016), 2) as tiv_2016
from Insurance a
left join (
    select tiv_2015, count(1) as policyholders
    from Insurance
    group by tiv_2015
) b
on a.tiv_2015 = b.tiv_2015
left join (
    select concat(lat, '-', lon) as location, count(1) as policyholders
    from Insurance
    group by concat(lat, '-', lon)
) c
on concat(a.lat, '-', a.lon) = c.location
where b.policyholders > 1 and c.policyholders = 1