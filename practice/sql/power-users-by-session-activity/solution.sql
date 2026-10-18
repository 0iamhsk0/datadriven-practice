SELECT 
  u1.user_id,
  u1.username,
  COUNT(u2.session_id) AS session_count,
  SUM(u2.pages_viewed) AS total_pages
FROM users AS u1
LEFT JOIN user_sessions AS u2
ON u1.user_id = u2.user_id
WHERE u1.account_status = 'active'
GROUP BY u1.username
HAVING COUNT(u2.session_id) >= 3 AND AVG(u2.pages_viewed) >= 25
ORDER BY 4 DESC;
