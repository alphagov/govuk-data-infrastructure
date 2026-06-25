resource "google_project_iam_binding" "bq_data_editor" {
  project = local.gcp_project_id
  role    = "roles/bigquery.dataEditor"

  members = [
    "serviceAccount:${local.processing_project_pipeline_executor_sa_email}",
  ]
}
