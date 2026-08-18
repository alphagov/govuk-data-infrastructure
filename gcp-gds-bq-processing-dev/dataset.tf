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

resource "google_bigquery_dataset" "fastly_processing_dev" {
  dataset_id = "fastly_processing_dev"
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "fastly_target_dev" {
  dataset_id = "fastly_target_dev"
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "fastly_dataform_assertions" {
  dataset_id = "fastly_dataform_assertions"
  location   = "europe-west2"
}

resource "google_bigquery_dataset" "fastly_reference_data_dev" {
  dataset_id = "fastly_reference_data_dev"
  location   = "europe-west2"
}
