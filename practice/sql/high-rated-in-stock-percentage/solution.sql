SELECT ROUND(
    100.0 * COUNT(CASE WHEN in_stock = 1 AND rating >= 4.0 THEN 1 END) / COUNT(*), 
    2
) AS pct_in_stock_high_rated
FROM products;
