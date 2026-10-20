WITH cat_avg as (
  SELECT AVG(price) as catalog_avg
  FROM products
)

SELECT 
  p.product_name,
  p.category,
  p.price,
  c.catalog_avg
FROM products p
CROSS join cat_avg as c
WHERE p.price > c.catalog_avg
ORDER BY p.price desc;
  

-- The grouping is the main problem: 
-- you're collapsing rows per product, so SUM(price) and AVG(price) 
-- describe one product instead of the whole catalog, and the comparison 
-- never tests a single price against the average. 
-- Think about what you need to compare each row against: 
-- a value that's the same for every row, computed separately. 
-- Also check how the rows should be ordered for the final output.
