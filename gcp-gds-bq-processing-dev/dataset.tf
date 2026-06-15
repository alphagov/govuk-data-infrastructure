resource "google_bigquery_dataset" "analytics_330577055_dev" {
  dataset_id = "analytics_330577055_dev"
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "dataform_assertions" {
  dataset_id = "dataform_assertions"
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "flattened_dataset_dev" {
  dataset_id = "flattened_dataset_dev"
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "govuk_ga4_processing_dev" {
  dataset_id = "govuk_ga4_processing_dev"
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "processing_dev" {
  dataset_id = "processing_dev"
  location   = "europe-west2"
}
