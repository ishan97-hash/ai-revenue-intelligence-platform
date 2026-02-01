resource "google_bigquery_dataset" "ai_revenue_dw" {
  dataset_id = "ai_revenue_dw"
  project    = var.project_id
  location   = "US"
}
