locals {
  # 1000ms * 60s * 60m * 24h * 90 days
  ninety_days_in_ms = 1000 * 60 * 60 * 24 * 90
}

resource "google_bigquery_dataset" "raw_events_dataset" {
  dataset_id                      = "analytics_523297687"
  friendly_name                   = "Analytics Property ID 523297687"
  description                     = "This dataset contains events tables from GA4 property ID 523297687"
  location                        = "europe-west2"
  default_partition_expiration_ms = local.ninety_days_in_ms
  default_table_expiration_ms     = local.ninety_days_in_ms

  depends_on = [google_project_service.project_services]
}

resource "google_bigquery_dataset" "aggregated_dataset" {
  dataset_id    = "aggregated_dataset"
  friendly_name = "Aggregated Outputs for GA4 Property ID 523297687"
  description   = "This dataset contains aggregated outputs from GA4 property ID 523297687"
  location      = "europe-west2"

  depends_on = [google_project_service.project_services]
}

resource "google_bigquery_dataset" "govuk_ga4_processing" {
  dataset_id                      = "govuk_ga4_processing"
  friendly_name                   = "Processing Dataset for GA4 Property ID 523297687"
  description                     = "This dataset contains intermediate processing steps for GA4 property ID 523297687"
  location                        = "europe-west2"
  default_partition_expiration_ms = local.ninety_days_in_ms

  depends_on = [google_project_service.project_services]
}
