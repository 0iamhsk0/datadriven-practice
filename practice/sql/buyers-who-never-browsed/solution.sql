SELECT u.username, t.total_amount
FROM users as u
LEFT JOIN transactions as t ON u.user_id = t.user_id
LEFT JOIN page_views as p ON u.user_id = p.user_id 
WHERE p.user_id IS NULL AND t.transaction_date BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY 2 ASC;


-- SELECT u.username, t.total_amount
-- FROM users AS u
-- LEFT JOIN transactions AS t
--     ON u.user_id = t.user_id
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM page_views AS p
--     WHERE p.user_id = u.user_id
-- )
-- AND t.transaction_date BETWEEN '2026-01-01' AND '2026-12-31'
-- ORDER BY t.total_amount ASC;
