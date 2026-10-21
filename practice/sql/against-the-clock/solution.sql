SELECT 
    job_id,
    job_name,
    EXTRACT(EPOCH FROM (ended::timestamp - started::timestamp)) / 60 AS runtime_minutes
FROM batch_jobs
WHERE ended IS NULL 
   OR ended::timestamp < started::timestamp;
