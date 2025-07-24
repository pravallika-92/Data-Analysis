-- CTE
WITH region_sales AS (
  SELECT 
    c.region,
    SUM(s.quantity * s.price) AS region_total
  FROM sales s
  JOIN customers c ON s.customer_id = c.id
  GROUP BY c.region
),
total_sales AS (
  SELECT SUM(region_total) AS grand_total FROM region_sales
)
SELECT 
  r.region,
  r.region_total,
  ROUND((r.region_total / t.grand_total) * 100, 2) AS contribution_percent
FROM region_sales r, total_sales t;
