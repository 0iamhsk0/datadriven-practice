-- SELECT 
--   u.username, 
--   u.account_status, 
--   MAX(STR_TO_DATE(u2.session_start)) as last_login,
--   COALESCE(SUM(t.total_amount), NULL) as lifetime_spend
-- FROM users as u
-- LEFT JOIN user_sessions as u2 ON u.user_id = u2.user_id
-- LEFT JOIN transactions as t ON u.user_id = t.user_id
-- WHERE u2.session_id IS NULL
-- GROUP BY u.user_id
-- HAVING MAX(u2.session_start::date) - u2.session_start::date > 90

-- -- for 1st cond: login > 90 days - we can use CTE and fetch 
-- -- Max or latest date - 90 days
-- -- for 2nd cond: us.session_id IS NULL

-- SELECT 
--     u.username, 
--     u.account_status, 
--     MAX(u2.session_start::timestamp) AS last_login, 
--     COALESCE(SUM(t.total_amount), 0) AS lifetime_spend
-- FROM users AS u
-- LEFT JOIN user_sessions AS u2 ON u.user_id = u2.user_id
-- LEFT JOIN transactions AS t ON u.user_id = t.user_id
-- WHERE u2.session_id IS NULL -- cond 2
-- GROUP BY u.user_id, u.username, u.account_status
-- HAVING MAX(u2.session_start::timestamp) - u2.session_start::timestamp > 90 -- cond 1

-- grain: one row per user, 
-- CTE1: last login per user, need rollup over user_id
WITH last_login as (
  SELECT user_id, MAX(session_start::timestamp) as last_login
  FROM user_sessions
  GROUP BY user_id
), 
-- CTE2: spend per user, 
user_spend as (
  SELECT user_id, SUM(total_amount) as lifetime_spend
  FROM transactions
  GROUP BY user_id
)

-- main: users LEFT JOIN both, filter.
SELECT
  u.username,
  u.account_status,
  l.last_login,
  COALESCE(us.lifetime_spend, 0) as lifetime_spend
FROM users u
LEFT JOIN last_login as l on u.user_id = l.user_id
LEFT JOIN user_spend as us on u.user_id = us.user_id
WHERE 
  u.account_status = 'active' 
  AND (l.last_login IS NULL OR NOW() - INTERVAL '90 days' > l.last_login)
