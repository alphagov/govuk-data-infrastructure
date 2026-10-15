resource "google_bigquery_dataset" "fastly_processing" {
  dataset_id = "fastly_processing"
  project    = google_project.project.project_id
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "govuk_ga4_processing" {
  dataset_id = "govuk_ga4_processing"
  project    = google_project.project.project_id
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "fastly_reference_data" {
  dataset_id = "fastly_reference_data"
  project    = google_project.project.project_id
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "fastly_dataform_assertions" {
  dataset_id = "fastly_dataform_assertions"
  project    = google_project.project.project_id
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "publishing_processing" {
  dataset_id = "publishing_processing"
  project    = google_project.project.project_id
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "govuk_feedback_processing_stg_s" {
  dataset_id = "govuk_feedback_processing_stg_s"
  project    = google_project.project.project_id
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "functions" {
  dataset_id = "functions"
  project    = google_project.project.project_id
  location   = "europe-west2"
}
