-- Window Function
SELECT *
FROM (
  SELECT 
    p.category,
    p.name AS product_name,
    SUM(s.quantity) AS total_sold,
    RANK() OVER (PARTITION BY p.category ORDER BY SUM(s.quantity) DESC) AS rank_in_category
  FROM sales s
  JOIN products p ON s.product_id = p.id
  GROUP BY p.category, p.name
) AS ranked
WHERE rank_in_category <= 3;
