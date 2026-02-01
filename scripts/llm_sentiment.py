from transformers import pipeline
import pandas as pd
from google.cloud import bigquery

print("Loading local sentiment model...")
sentiment = pipeline("sentiment-analysis")

bq = bigquery.Client()

df = bq.query("""
  SELECT product_id, review_text
  FROM ai_revenue_dw.bronze_reviews
  WHERE review_text IS NOT NULL
  LIMIT 3000
""").to_dataframe()

print("Scoring", len(df), "reviews")

def score(text):
    r = sentiment(text[:512])[0]
    return 5 if r["label"] == "POSITIVE" else 1

df["sentiment_score"] = df["review_text"].apply(score)

bq.load_table_from_dataframe(
    df,
    "ai-revenue-platform.ai_revenue_dw.bronze_reviews",
    job_config=bigquery.LoadJobConfig(write_disposition="WRITE_TRUNCATE")
).result()

print("Sentiment table created")
