resource "google_bigquery_dataset_iam_member" "publishing_dataset_editor" {
  for_each = toset([
    "serviceAccount:custom-dataform-2@govuk-publishing.iam.gserviceaccount.com",
    "serviceAccount:custom-publishing-dataform-ser@govuk-publishing.iam.gserviceaccount.com"
  ])

  dataset_id = google_bigquery_dataset.publishing_processing.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = each.value
}