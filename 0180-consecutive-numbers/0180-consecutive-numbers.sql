# Write your MySQL query statement below
select DISTINCT num as ConsecutiveNums
from (
    select num, id_offset, count(1) as cnt
    from (
        select num, (id -num_index) as id_offset
        from (
            select cast(id as SIGNED) as id, num, cast(row_number() over (partition by num order by id) as SIGNED) as num_index
            from `Logs`
        ) g1
    ) g2
    group by num, id_offset
) g3
where cnt >= 3
