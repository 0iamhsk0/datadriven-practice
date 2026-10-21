SELECT 
  p.product_name,
  COALESCE(SUM(CASE WHEN p.category = 'Electronics' THEN t.total_amount ELSE 0 END), 0) as electronics_total
FROM products as p
LEFT JOIN transactions as t
ON p.product_id = t.product_id
GROUP BY 1
ORDER BY 2 DESC;
