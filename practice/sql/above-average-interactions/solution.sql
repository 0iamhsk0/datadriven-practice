-- -- using a single CTE and one subquery on the select clause

-- WITH count_all as (
--   SELECT user_id, COUNT(*) as total_sessions
--   FROM user_sessions
--   GROUP BY user_id
-- )

-- SELECT user_id, total_sessions
-- FROM count_all
-- WHERE total_sessions > (SELECT AVG(total_sessions) FROM count_all)
-- ORDER BY total_sessions DESC, user_id ASC;

-- using 2 CTE, one for counting the sessions_id, other for performing avg
WITH count_all as (
  SELECT user_id, COUNT(*) as total_sessions
  FROM user_sessions
  GROUP BY user_id
),
avg_count as (
   SELECT 
     user_id,
     total_sessions,
     AVG(total_sessions::numeric) OVER() as total_avg
   FROM count_all 
 )

SELECT user_id, total_sessions
FROM avg_count
WHERE total_sessions > total_avg
ORDER BY total_sessions DESC, user_id ASC;
