WITH count_all as (
  SELECT user_id, COUNT(*) as total_sessions
  FROM user_sessions
  GROUP BY user_id
)

SELECT user_id, total_sessions
FROM count_all
WHERE total_sessions > (SELECT AVG(total_sessions) FROM count_all)
ORDER BY total_sessions DESC, user_id ASC;
