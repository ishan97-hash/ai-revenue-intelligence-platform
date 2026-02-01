SELECT *
FROM {{ ref('fact_sales_base') }}
WHERE total_revenue < 0