SELECT
  CAST(Invoice AS STRING)          AS order_id,
  CAST(StockCode AS STRING)        AS product_id,
  TRIM(Description)                AS product_name,
  CAST(`Customer_ID` AS STRING)    AS customer_id,
  Country                          AS country,
  CAST(Quantity AS INT64)          AS quantity,
  CAST(Price AS FLOAT64)           AS unit_price,
  CAST(Quantity AS FLOAT64) * CAST(Price AS FLOAT64) AS revenue,
  InvoiceDate                      AS order_ts,
  DATE(InvoiceDate)                AS order_date
FROM {{ source('raw','bronze_transactions') }}
WHERE `Customer_ID` IS NOT NULL
  AND Quantity > 0
  AND Price > 0
