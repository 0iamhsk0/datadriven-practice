SELECT
  u.username,
  SUM(ad.revenue) as total_revenue
FROM users as u
LEFT JOIN ad_impressions as ad
ON u.user_id = ad.user_id
WHERE clicked = 1
GROUP BY 1
ORDER BY 2 DESC;
