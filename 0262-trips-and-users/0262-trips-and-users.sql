# Write your MySQL query statement below

# push down the predicate(where b.banned...)
select request_at as Day, round(sum(if(`status`="cancelled_by_driver" or `status`="cancelled_by_client", 1, 0))/sum(1), 2) as `Cancellation Rate`
from (
    select a.`status`, a.request_at, b.banned as client_banned, c.banned as driver_banned
    from (
        select id, client_id, driver_id, `status`, request_at
        from Trips
        where request_at between '2013-10-01' and '2013-10-03'
    ) a
    left join Users b
        on a.client_id = b.users_id
    left join Users c
        on a.driver_id = c.users_id
    where b.banned="No" and c.banned="No"
) g
group by request_at