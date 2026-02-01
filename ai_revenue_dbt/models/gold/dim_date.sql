SELECT DISTINCT
  order_date AS date_key,
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  EXTRACT(QUARTER FROM order_date) AS quarter,
  EXTRACT(WEEK FROM order_date) AS week
FROM {{ ref('stg_transactions') }}
