SELECT
    SUM(CASE WHEN transaction_date >= DATE('2026-09-17', '-30 days')  THEN 1 ELSE 0 END) AS last_30,
    SUM(CASE WHEN transaction_date >= DATE('2026-09-17', '-180 days') THEN 1 ELSE 0 END) AS last_180,
    COUNT(*) AS all_time
FROM transactions;
