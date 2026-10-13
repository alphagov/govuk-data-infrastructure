resource "google_bigquery_dataset_iam_member" "publishing_dataset_editor" {
  dataset_id = google_bigquery_dataset.publishing_processing.dataset_id
  role       = google_project_iam_custom_role.gds_bigquery_editor.name
  member     = "serviceAccount:custom-dataform-2@govuk-publishing.iam.gserviceaccount.com"
}