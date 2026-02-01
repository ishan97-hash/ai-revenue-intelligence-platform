🚀 AI Revenue Intelligence Platform

End-to-End Analytics, Sentiment Intelligence & Revenue Forecasting

📌 Project Overview

The AI Revenue Intelligence Platform is a full-stack analytics and machine learning system that transforms raw retail transactions and customer reviews into actionable business intelligence and revenue forecasts.

It integrates:

Transactional sales data

Customer sentiment (NLP)

Time-series forecasting (ML)

Enterprise data modeling (dbt)

Executive dashboards (Power BI)

This project demonstrates how modern data teams build reliable, scalable, decision-support systems.

🏗️ Architecture
Raw Data
├── Retail Transactions
├── Amazon Product Reviews
        │
        ▼
BigQuery (Bronze Layer)
        │
        ▼
dbt (Silver → Gold Models)
        │
        ├── Star Schema Warehouse
        │   ├── fact_sales
        │   ├── dim_customer
        │   ├── dim_product
        │   └── dim_date
        │
        ├── Sentiment-Enriched Facts
        │
        ▼
Machine Learning
├── DistilBERT Sentiment Scoring
├── Prophet Revenue Forecasting
        │
        ▼
Power BI Executive Dashboards

🔧 Tech Stack
Layer	Tools
Data Warehouse	BigQuery
Transformations	dbt
Orchestration	Python
NLP	HuggingFace (DistilBERT)
Forecasting	Facebook Prophet
BI & Reporting	Power BI
Version Control	Git, GitHub
📊 Analytics Delivered
1️⃣ Descriptive Analytics

Monthly & country-level revenue

Top products & customers

Revenue trends

2️⃣ Diagnostic Analytics

Revenue concentration (Pareto 80/20)

Customer Lifetime Value (CLV) segments

Sentiment vs revenue relationship

3️⃣ Predictive Analytics

Prophet time-series forecasting

Confidence intervals (yhat_lower / yhat_upper)

Actual vs forecast overlay

🧪 Data Quality & Governance

dbt tests (not null, accepted values)

Source freshness checks

Star-schema dimensional modeling

Automated compile + validation

📂 Repository Structure
ai_revenue_platform/
├── ai_revenue_dbt/
│   ├── models/
│   │   ├── bronze/
│   │   ├── silver/
│   │   └── gold/
│   ├── analyses/
│   ├── macros/
│   ├── tests/
│   └── dbt_project.yml
│
├── scripts/
│   ├── llm_sentiment.py
│   ├── prophet_forecast.py
│   ├── ingest_sales.py
│   └── ingest_reviews.py
│
├── data/
│   └── raw/
│
├── dashboards/
│   └── powerbi_dashboard.pbix
│
└── README.md

▶️ How to Run
1️⃣ Load raw data to BigQuery
python scripts/ingest_sales.py
python scripts/ingest_reviews.py

2️⃣ Run transformations
cd ai_revenue_dbt
dbt run
dbt test

3️⃣ Run ML models
python scripts/llm_sentiment.py
python scripts/prophet_forecast.py

4️⃣ Open Dashboard

Open dashboards/powerbi_dashboard.pbix in Power BI and connect to BigQuery.

💡 Key Business Insights (Example)

Top 20% of customers generate ~80% of revenue

Positive sentiment products have higher average revenue

Revenue is forecasted to grow steadily despite short-term volatility

🎯 Why This Matters

This project simulates a real-world enterprise analytics environment and shows how data, ML, and BI come together to:

Drive strategic decisions

Predict business performance

Identify high-value customers & products