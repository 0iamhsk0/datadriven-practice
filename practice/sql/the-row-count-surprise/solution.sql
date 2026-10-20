SELECT 'inner_join' AS join_type, COUNT(*) AS row_count
FROM users u
JOIN ad_impressions i ON u.user_id = i.user_id

UNION ALL

SELECT 'left_join' AS join_type, COUNT(*) AS row_count
FROM users u
LEFT JOIN ad_impressions i ON u.user_id = i.user_id

UNION ALL

SELECT 'full_outer_join' AS join_type, COUNT(*) AS row_count
FROM users u
FULL OUTER JOIN ad_impressions i ON u.user_id = i.user_id;
