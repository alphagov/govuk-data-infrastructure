resource "google_bigquery_dataset_iam_member" "publishing_dataset_editor" {
  dataset_id = google_bigquery_dataset.publishing_processing.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:custom-dataform-2@govuk-publishing.iam.gserviceaccount.com"
}

resource "google_bigquery_dataset_iam_member" "feedback_processing_dataset_editor" {
  dataset_id = google_bigquery_dataset.govuk_feedback_processing_stg_s.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:${google_service_account.feedback_processing.email}"
}
