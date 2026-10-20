SELECT COUNT(DISTINCT owner_id) AS distinct_owners
FROM api_tokens
WHERE issued >= '2026-01-01' 
  AND issued < '2027-01-01';
