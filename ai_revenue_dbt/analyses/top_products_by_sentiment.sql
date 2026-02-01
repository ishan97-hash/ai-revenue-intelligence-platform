SELECT
  p.product_name,
  ROUND(AVG(f.avg_sentiment), 2) AS avg_sentiment,
  SUM(f.total_revenue) AS total_revenue
FROM ai_revenue_dw.fact_sales_enriched f
JOIN ai_revenue_dw.dim_product p
  ON f.product_id = p.product_id
GROUP BY 1
ORDER BY avg_sentiment DESC
LIMIT 20;
