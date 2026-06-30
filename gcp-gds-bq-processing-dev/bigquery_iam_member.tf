# Grant the dedicated "dev" service account from gds-bq-processing BigQuery admin permissions
resource "google_project_iam_member" "data_processing_bq_admin" {
  project = module.managed_project.project.project_id
  role    = "roles/bigquery.admin"
  member  = "serviceAccount:data-processing-dev-gds-bq-pro@gds-bq-processing.iam.gserviceaccount.com"
}

# Grant the dedicated "aggregate-analytics-executor" service account BigQuery data editor permissions for assertions dataset access
resource "google_project_iam_member" "aggregate_analytics_bq_data_editor" {
  project = module.managed_project.project.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:aggregate-analytics-executor@gds-bq-processing.iam.gserviceaccount.com"
}
