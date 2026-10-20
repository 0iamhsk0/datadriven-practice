-- 1st cte to build product avg sale


WITH avgs as (
  SELECT
    p.product_id,
    p.category,
    p.product_name,
    AVG(t.total_amount) OVER (PARTITION BY p.product_name) as product_avg,
    AVG(t.total_amount) OVER (PARTITION BY p.category) as category_avg
  FROM products as p
  INNER JOIN transactions as t
  ON p.product_id = t.product_id
 )
  
SELECT 
  product_name,
  product_avg,
  category_avg
FROM avgs
WHERE product_avg > category_avg
GROUP BY product_name;
