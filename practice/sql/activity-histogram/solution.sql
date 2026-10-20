WITH user_counts AS (
    SELECT user_id, COUNT(*) AS session_count
    FROM user_sessions
    GROUP BY user_id
)
SELECT 
    session_count, 
    COUNT(*) AS user_count
FROM user_counts
GROUP BY session_count
ORDER BY session_count ASC;
