SELECT 
    AVG(CASE WHEN in_stock = 1 AND rating >= 4.0 THEN 1.0 ELSE 0.0 END) * 100.000 
AS pct_in_stock_high_rated
FROM products;

-- SELECT ROUND(
--     100.0 * COUNT(CASE WHEN in_stock = 1 AND rating >= 4.0 THEN 1 END) / COUNT(*), 
--     2
-- ) AS pct_in_stock_high_rated
-- FROM products;
