locals {
  dataform_sa_impersonation_roles = [
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountTokenCreator"
  ]
}

resource "google_service_account_iam_member" "dataform_agent_impersonation" {
  for_each           = toset(local.dataform_sa_impersonation_roles)
  service_account_id = google_service_account.data_processing.name
  role               = each.key
  member             = "serviceAccount:service-${google_project.project.number}@gcp-sa-dataform.iam.gserviceaccount.com"
}

resource "google_service_account_iam_member" "dataform_aggregate_analytics_agent_impersonation" {
  for_each           = toset(local.dataform_sa_impersonation_roles)
  service_account_id = google_service_account.aggregate_analytics_pipeline_executor.name
  role               = each.key
  member             = "serviceAccount:service-${google_project.project.number}@gcp-sa-dataform.iam.gserviceaccount.com"
}

resource "google_service_account_iam_member" "aggregate_analytics_pipeline_executor_developer_act_as" {
  service_account_id = google_service_account.aggregate_analytics_pipeline_executor.name
  role               = "roles/iam.serviceAccountUser"
  member             = "group:gcp-gds-bq-processing-editors@digital.cabinet-office.gov.uk"
}

resource "google_project_iam_member" "bq_job_user" {
  project = google_project.project.project_id
  role    = "roles/bigquery.jobUser"
  member  = "serviceAccount:${google_service_account.aggregate_analytics_pipeline_executor.email}"
}
