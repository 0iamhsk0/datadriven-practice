-- PostgreSQL
-- SELECT
--   event_type,
--   COUNT(CASE WHEN EXTRACT(ISODOW FROM event_timestamp :: DATE) IN(6,  7) THEN 1 END) AS weekend_count,
--   COUNT(CASE WHEN EXTRACT(ISODOW FROM event_timestamp :: DATE) BETWEEN 1 AND 5 THEN 1 END) AS weekday_count
-- FROM event_data
-- GROUP BY 1
-- ORDER BY 1 DESC ;

-- PostgreSQL using FILTER()
-- SELECT
--   event_type,
--   COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM event_timestamp :: DATE) IN(6,  7) THEN 1 END) AS weekend_count,
--   COUNT(*) FILTER (WHERE EXTRACT(ISODOW FROM event_timestamp :: DATE) BETWEEN 1 AND 5 THEN 1 END) AS weekday_count
-- FROM event_data
-- GROUP BY 1
-- ORDER BY 1 DESC ;

-- MySQL

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
