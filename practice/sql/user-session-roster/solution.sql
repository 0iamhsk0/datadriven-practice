SELECT 
  LOWER(TRIM(u.username)) as username,
  u.account_status,
  u.signup_date,
  us.session_start
FROM users as u
LEFT JOIN user_sessions as us
ON u.user_id = us.user_id
-- WHERE us.session_start IS NULL or us.session_id IS NULL
ORDER BY 1 ASC, 4 ASC; 

-- By commenting out the WHERE clause, the LEFT JOIN successfully keeps the users with no sessions 
-- (their session_start will just show up as NULL in the results), 
-- while also showing all the users who do have sessions.
