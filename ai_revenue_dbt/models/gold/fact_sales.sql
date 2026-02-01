SELECT
  b.order_id,
  b.customer_id,
  b.product_id,
  b.order_date,
  b.total_quantity,
  b.total_revenue,
  s.avg_sentiment
FROM {{ ref('fact_sales_base') }} b
LEFT JOIN {{ ref('fct_sentiment') }} s
  ON b.product_id = s.product_id
