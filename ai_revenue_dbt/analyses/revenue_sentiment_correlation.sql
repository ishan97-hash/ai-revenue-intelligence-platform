-- Relationship between sentiment and revenue
SELECT
  CORR(avg_sentiment, total_revenue) AS sentiment_revenue_corr
FROM ai_revenue_dw.fact_sales_enriched;
