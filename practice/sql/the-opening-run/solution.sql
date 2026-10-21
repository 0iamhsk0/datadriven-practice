WITH ranked_runs AS (
    SELECT 
        job_name,
        rows_done,
        started,
        ROW_NUMBER() OVER (PARTITION BY job_name ORDER BY started ASC, job_id ASC) AS rn
    FROM batch_jobs
)
SELECT 
    job_name,
    rows_done
FROM ranked_runs
WHERE rn = 1
ORDER BY job_name ASC;
