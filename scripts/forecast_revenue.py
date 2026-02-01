from google.cloud import bigquery
import pandas as pd
from prophet import Prophet

client = bigquery.Client()

QUERY = """
SELECT
  month,
  revenue
FROM ai_revenue_dw.monthly_revenue
ORDER BY month
"""

df = client.query(QUERY).to_dataframe()

df = df.rename(columns={"month": "ds", "revenue": "y"})

model = Prophet()
model.fit(df)

future = model.make_future_dataframe(periods=6, freq="MS")
forecast = model.predict(future)

forecast_out = forecast[["ds", "yhat", "yhat_lower", "yhat_upper"]]

forecast_out["model"] = "prophet_v1"

table_id = "ai-revenue-platform.ai_revenue_dw.revenue_forecast"

job = client.load_table_from_dataframe(
    forecast_out,
    table_id,
    job_config=bigquery.LoadJobConfig(write_disposition="WRITE_TRUNCATE")
)

job.result()

print("Forecast written to BigQuery!")
