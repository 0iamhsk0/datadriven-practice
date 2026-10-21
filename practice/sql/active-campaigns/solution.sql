SELECT 
  ad_campaign,
  COUNT(impression_id) as impressions,
  SUM(revenue) as total_revenue,
  ROUND(SUM(CASE WHEN clicked = 1 then 1 else 0 END)::NUMERIC * 100.0 / COUNT(impression_id), 1) as CTR
FROM ad_impressions
GROUP BY ad_campaign
HAVING COUNT(impression_id) > 15
ORDER BY 4 DESC, 1 ASC;
