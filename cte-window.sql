-- CTE + Window Function
WITH monthly_sales AS (
  SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS sale_month,
    SUM(quantity * price) AS monthly_total
  FROM sales
  GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
)
SELECT 
  sale_month,
  monthly_total,
  SUM(monthly_total) OVER (ORDER BY sale_month) AS running_total
FROM monthly_sales;
