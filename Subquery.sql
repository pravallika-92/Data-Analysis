-- Subquery
SELECT 
  CASE 
    WHEN purchase_count = 1 THEN 'New Customer'
    ELSE 'Repeat Customer'
  END AS customer_type,
  COUNT(*) AS total_customers
FROM (
  SELECT customer_id, COUNT(*) AS purchase_count
  FROM sales
  GROUP BY customer_id
) AS customer_summary
GROUP BY customer_type;
