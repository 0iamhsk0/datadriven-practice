-- using CTE to calc avg first
-- WITH cat_avg as (
--   SELECT AVG(price) as catalog_avg
--   FROM products
-- )
-- SELECT
--   p.product_name,
--   p.category,
--   p.price,
--   c.catalog_avg
-- FROM products p
-- CROSS join cat_avg as c
-- WHERE p.price > c.catalog_avg
-- ORDER BY p.price desc;


-- using a single window - function
-- WITH cat_avg as (
-- SELECT
--   product_name,
--   category,
--   price,
--   AVG(price) OVER () as catalog_avg
-- FROM products
-- )
-- SELECT *
-- FROM cat_avg
-- WHERE price > catalog_avg
-- ORDER BY price desc;


-- using subquery
SELECT
  product_name,
  category,
  price,
  (
    SELECT
      AVG(price)
    FROM products
  ) AS catalog_avg
FROM products
WHERE price > (
  SELECT
    AVG(price)
  FROM products
)
ORDER BY price DESC
