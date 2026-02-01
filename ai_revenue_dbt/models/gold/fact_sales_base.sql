SELECT
  order_id,
  customer_id,
  product_id,
  order_date,
  SUM(quantity) AS total_quantity,
  SUM(revenue) AS total_revenue
FROM {{ ref('stg_transactions') }}
GROUP BY 1,2,3,4
