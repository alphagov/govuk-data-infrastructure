resource "google_service_account" "data_processing" {
  account_id   = "data-processing"
  display_name = "data_processing"
  project      = google_project.project.project_id
  description  = "" # has to match existing
}

resource "google_service_account" "data_processing_dev" {
  account_id   = "data-processing-dev-gds-bq-pro"
  display_name = "data-processing-dev"
  project      = google_project.project.project_id
  description  = "Dataform Dev Workspace SA"
}

resource "google_service_account" "aggregate_analytics_pipeline_executor" {
  project      = google_project.project.project_id
  account_id   = "aggregate-analytics-executor"
  display_name = "Aggregate Analytics Pipeline Executor"
  description  = "Service account used by the GA4 Aggregate Analytics pipeline in gds-bq-processing to execute BigQuery jobs in the ga4-aggregate-analytics project"
}
