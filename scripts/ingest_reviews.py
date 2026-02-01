from google.cloud import bigquery
import json
import pandas as pd
import os

print("Starting review ingestion...")

path = "../data/raw/reviews/Electronics_5.json"
print("Looking for file:", os.path.abspath(path))

client = bigquery.Client()
rows = []

with open(path, "r", encoding="utf-8") as f:
    for i, line in enumerate(f):
        r = json.loads(line)
        if r.get("reviewText") and r.get("asin"):
            rows.append({
                "product_id": r["asin"],
                "review_text": r["reviewText"],
                "review_time": r.get("unixReviewTime")
            })
        if i > 50000:  # cost guard
            break

df = pd.DataFrame(rows)

print("Rows parsed:", len(df))

table_id = "ai-revenue-platform.ai_revenue_dw.bronze_reviews"
job = client.load_table_from_dataframe(df, table_id)
job.result()

print("Uploaded to BigQuery")
