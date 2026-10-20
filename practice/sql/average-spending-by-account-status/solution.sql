-- 1st CTE for finding total amount for each account_status


-- -- 2nd CTE by using CTE 1, finding the avg of total amount for each account_status 
-- avg_ts as (
--   SELECT 
--     user_id,
--     AVG(total_amt) as avg_total_spending
--   FROM total_spend
--   GROUP BY user_id
-- )
  
-- SELECT u.account_status, a.avg_total_spending
-- FROM users as u
-- LEFT JOIN avg_ts as a
-- ON u.user_id = a.user_id
-- GROUP BY u.account_status



-- Hint
-- The main gap is in how the final query relates users to spending.
--  Your LEFT JOIN keeps every user, including the ones who never bought anything, 
--  and that is what the problem says to exclude. 
--  Think about which join type keeps only users with at least one transaction, 
--  and also check whether averaging per user_id inside avg_ts gives 
--  you the average across buyers the way the final result needs.


WITH user_lifetime_spend AS (
    -- Step 1: Get the total spend for each individual user
    SELECT 
        u.user_id,
        u.account_status,
        COALESCE(SUM(t.total_amount), 0) AS lifetime_spend
    FROM users u
    INNER JOIN transactions t ON u.user_id = t.user_id
    GROUP BY u.user_id, u.account_status
)
-- Step 2: Average those lifetime spends across each account status
SELECT 
    account_status,
    AVG(lifetime_spend) AS avg_lifetime_spend
FROM user_lifetime_spend
GROUP BY account_status
ORDER BY account_status;


-- The gap that matters most is the join in the final query: 
-- LEFT JOIN keeps users with no transactions, and those users 
-- drag their status averages down with zero-spend rows. Ask yourself 
-- which join type keeps only users who have at least one matching transaction.
--  Also, the per-user spend you compute in user_lifetime_spend is 
--  already the right grain, so the last step only needs 
-- to average across those buyers within each account status.
