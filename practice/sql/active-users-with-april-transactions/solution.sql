WITH total_transactions as (
  SELECT
    u.user_id,
    u.account_status,
    t.transaction_id,
    t.transaction_date,
    COUNT(transaction_id) as transac_cnt,
    COUNT(DISTINCT u.user_id) as user_cnt
  FROM users as u
  LEFT JOIN transactions as t
  ON u.user_id = t.user_id
  WHERE u.account_status = 'active' AND (t.transaction_date >= '2026-04-01' AND t.transaction_date < '2026-05-01')
  GROUP BY u.user_id
  HAVING COUNT(transaction_id) >= 1
)
  
  
SELECT user_cnt as active_users_with_transactions
FROM total_transactions;
