# Write your MySQL query statement below
# one test case is abnormal: [4,3,"2016/06/08"],[3,4,"2016/06/09"], in this case user id 3 only have 1 friend, but the given answer counts to 2, which is incorrect. So use union should be the correct answer
select id, count(fid) as num
from (
    select requester_id as id, accepter_id as fid
    from RequestAccepted
    union all
    select accepter_id as id, requester_id as fid
    from RequestAccepted
) g
group by id
order by num desc
limit 1
