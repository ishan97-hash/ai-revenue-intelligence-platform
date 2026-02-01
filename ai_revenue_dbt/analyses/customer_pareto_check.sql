WITH ranked AS (
  SELECT
    customer_id,
    SUM(total_revenue) AS revenue
  FROM ai_revenue_dw.fact_sales_enriched
  GROUP BY 1
),
dist AS (
  SELECT *,
    SUM(revenue) OVER() AS total_rev,
    SUM(revenue) OVER(ORDER BY revenue DESC) AS running_rev
  FROM ranked
)
SELECT
  COUNTIF(running_rev <= 0.8 * total_rev) AS customers_for_80_percent,
  COUNT(*) AS total_customers,
  ROUND(COUNTIF(running_rev <= 0.8 * total_rev) / COUNT(*) * 100, 2) AS pct_customers
FROM dist;
