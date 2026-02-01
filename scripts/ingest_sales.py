from google.cloud import bigquery
import pandas as pd

client = bigquery.Client()

# Load Excel
df = pd.read_excel("../data/raw/retail/online_retail_II.xlsx")

# Normalize column names
df.columns = [c.strip().replace(" ", "_") for c in df.columns]

# Enforce schema
df["Invoice"] = df["Invoice"].astype(str)
df["StockCode"] = df["StockCode"].astype(str)
df["Description"] = df["Description"].astype(str)
df["Customer_ID"] = df["Customer_ID"].astype("Int64")
df["Country"] = df["Country"].astype(str)

df["Quantity"] = pd.to_numeric(df["Quantity"], errors="coerce")
df["Price"] = pd.to_numeric(df["Price"], errors="coerce")

table_id = "ai-revenue-platform.ai_revenue_dw.bronze_transactions"

job = client.load_table_from_dataframe(
    df,
    table_id,
    job_config=bigquery.LoadJobConfig(write_disposition="WRITE_TRUNCATE")
)
job.result()

print(f"Loaded {job.output_rows} rows into {table_id}")
