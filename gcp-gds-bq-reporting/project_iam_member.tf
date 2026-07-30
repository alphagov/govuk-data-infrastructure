resource "google_project_iam_member" "bigquery_job_user" {
  project = local.project_id
  role    = "roles/bigquery.jobUser"
  member  = google_service_account.scheduled_query_runner.member
}

resource "google_project_iam_member" "bigquery_data_editor" {
  project = local.project_id
  role    = "roles/bigquery.dataEditor"
  member  = google_service_account.scheduled_query_runner.member
}
