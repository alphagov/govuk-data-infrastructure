resource "google_project_iam_binding" "project_owners" {
  project = google_project.project.project_id
  role    = "roles/owner"

  members = [
    "group:gcp-gds-bq-processing-owners@digital.cabinet-office.gov.uk",
    "serviceAccount:terraform-cloud-production@govuk-production.iam.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "project_editors" {
  project = google_project.project.project_id
  role    = "roles/editor"
  members = [
    "group:gcp-gds-bq-processing-editors@digital.cabinet-office.gov.uk",
  ]
}

# Creating this role with no members allows terraform to enforce that nobody should have project-wide roles/viewer access.
resource "google_project_iam_binding" "project_viewers" {
  project = google_project.project.project_id
  role    = "roles/viewer"
  members = []
}

resource "google_project_iam_binding" "code_viewers" {
  project = google_project.project.project_id
  role    = google_project_iam_custom_role.code_viewer.name
  members = [
    "group:gcp-gds-bq-processing-code-viewers@digital.cabinet-office.gov.uk",
  ]
}

resource "google_bigquery_dataset_iam_member" "processing_bigquery_read_access" {
  project    = google_project.project.project_id
  dataset_id = "govuk_ga4_processing"
  role       = "roles/bigquery.dataViewer"
  member     = "serviceAccount:service-702876067064@gcp-sa-dataform.iam.gserviceaccount.com" # govuk-airflow-test: Dataform read access for pipeline testing
}
