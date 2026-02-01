SELECT
  product_id,
  product_name,
  SUM(revenue) AS total_product_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM {{ ref('stg_transactions') }}
GROUP BY 1,2
