# Write your MySQL query statement below
select name as results
from (
    select b.name
    from (
        select user_id, count(1) as rated_counts
        from MovieRating
        group by user_id
    ) a inner join Users b
    on a.user_id = b.user_id
    order by a.rated_counts desc, b.name asc
    limit 1
) g
union all
select title
from (
    select b.title
    from (
        select movie_id, avg(rating) as avg_rating
        from MovieRating
        where DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
        group by movie_id
    ) a inner join Movies b
    on a.movie_id = b.movie_id
    order by a.avg_rating desc, b.title asc
    limit 1
) g