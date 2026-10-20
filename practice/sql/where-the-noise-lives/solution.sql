SELECT 
  TO_CHAR(log_timestamp::timestamp, 'FMDay') AS day_of_week,
  COUNT(*) AS entry_count
FROM server_logs
GROUP BY 1
