resource "google_project_iam_binding" "bq_data_editor" {
  project = local.gcp_project_id
  role    = "roles/bigquery.dataEditor"

  members = [
    "serviceAccount:${local.processing_project_pipeline_executor_sa_email}",
  ]
}

resource "google_project_iam_binding" "bq_job_user" {
  project = local.gcp_project_id
  role    = "roles/bigquery.jobUser"
  members = [
    "serviceAccount:${local.processing_project_pipeline_executor_sa_email}",
  ]
}
