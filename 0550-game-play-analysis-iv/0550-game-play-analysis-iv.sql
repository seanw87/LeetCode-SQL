# Write your MySQL query statement below
SELECT Round(Count(DISTINCT IF(nday = 1
                               AND if_first = 1, player_id, NULL)) /
                    Count(DISTINCT player_id), 2) AS fraction
FROM   (SELECT a.player_id,
               Datediff(b.event_date, a.event_date) AS nday,
               rank()
                 over (
                   PARTITION BY a.player_id
                   ORDER BY a.event_date)           AS if_first
        FROM   activity a
               inner join activity b
                       ON a.player_id = b.player_id
        WHERE  b.event_date >= a.event_date) g 