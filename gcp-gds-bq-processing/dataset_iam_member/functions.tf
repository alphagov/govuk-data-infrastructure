resource "google_bigquery_dataset_iam_binding" "functions_dataset_viewer" {
  dataset_id = google_bigquery_dataset.functions.dataset_id
  role       = "roles/bigquery.dataViewer"
  members = [
    "serviceAccount:${google_service_account.feedback_processing_dev.email}",
    "serviceAccount:${google_service_account.feedback_processing.email}"
  ]
}
