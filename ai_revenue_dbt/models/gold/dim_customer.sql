SELECT
  customer_id,
  country,
  MIN(order_date) AS first_purchase_date,
  COUNT(DISTINCT order_id) AS lifetime_orders,
  SUM(revenue) AS lifetime_revenue
FROM {{ ref('stg_transactions') }}
GROUP BY 1,2
