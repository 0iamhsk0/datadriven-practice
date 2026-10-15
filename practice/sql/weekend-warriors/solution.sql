-- 1. PostgreSQL using conditional aggregation
-- AND using ISODOW [Mon - Fri: 1 - 5; Sat, Sun = 6, 7 ✋🤚]
-- SELECT
--   event_type,
--   COUNT(CASE WHEN EXTRACT(ISODOW FROM event_timestamp :: DATE) IN(6,  7) THEN 1 END) AS weekend_count,
--   COUNT(CASE WHEN EXTRACT(ISODOW FROM event_timestamp :: DATE) BETWEEN 1 AND 5 THEN 1 END) AS weekday_count
-- FROM event_data
-- GROUP BY 1
-- ORDER BY 1 DESC ;

-- 2. PostgreSQL using FILTER()
-- SELECT
--   event_type,
--   COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM event_timestamp :: DATE) IN(6,  7) THEN 1 END) AS weekend_count,
--   COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM event_timestamp :: DATE) BETWEEN 1 AND 5 THEN 1 END) AS weekday_count
-- FROM event_data
-- GROUP BY 1
-- ORDER BY 1 DESC ;

-- 3. MySQL using DAYOFWEEK [Mon - Fri : 2 - 6; Sat, Sun = 7, 1) [supported right here]
SELECT
    event_type,
    COUNT(
        CASE
            WHEN DAYOFWEEK(event_timestamp) IN (1, 7)
            THEN 1
        END
    ) AS weekend_count,
    COUNT(
        CASE
            WHEN DAYOFWEEK(event_timestamp) BETWEEN 2 AND 6
            THEN 1
        END
    ) AS weekday_count
FROM event_data
GROUP BY event_type
ORDER BY 2 DESC;

-- 4. MySQL using WEEKDAY [Mon - Fri : 0 - 4; Sat, Sun = 5, 6]
-- SELECT
--   event_type,
--   SUM(
--     CASE
--       WHEN WEEKDAY(event_timestamp) IN (5, 6) THEN 1
--       ELSE 0
--     END
--   ) AS weekend_count,
--   SUM(
--     CASE
--       WHEN WEEKDAY(event_timestamp) BETWEEN 0
--       AND 4 THEN 1
--       ELSE 0
--     END
--   ) AS weekday_count
-- FROM event_data
-- GROUP BY 1
-- ORDER BY 2 DESC
