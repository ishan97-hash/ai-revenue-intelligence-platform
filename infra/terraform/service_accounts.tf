resource "google_service_account" "dbt_sa" {
  account_id   = "dbt-analytics-sa"
  display_name = "DBT Analytics Service Account"
}

resource "google_project_iam_member" "dbt_bq" {
  project = var.project_id
  role    = "roles/bigquery.admin"
  member  = "serviceAccount:${google_service_account.dbt_sa.email}"
}
