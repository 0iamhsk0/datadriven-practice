SELECT 
  EXTRACT(MONTH FROM event_timestamp::timestamp) AS month,
  COUNT(*) AS event_count
FROM event_data
GROUP BY 1
ORDER BY 1 ASC;
