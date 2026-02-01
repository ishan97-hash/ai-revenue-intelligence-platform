SELECT
  product_id,
  AVG(sentiment_score) AS avg_sentiment
FROM `ai-revenue-platform.ai_revenue_dw.bronze_reviews`
WHERE sentiment_score IS NOT NULL
GROUP BY 1
