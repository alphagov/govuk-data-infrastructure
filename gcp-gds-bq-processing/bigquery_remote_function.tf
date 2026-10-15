resource "google_bigquery_connection" "dlp_deidentify_service_conn" {
  project       = google_project.project.project_id
  location      = var.region
  connection_id = "dlp-deidentify-service-conn"
  friendly_name = "DLP Deidentify Service Remote Function Connector"
  description   = "Delegated connection to invoke DLP Deidentify Service in govuk-knowledge-graph project."

  cloud_resource {}
}

resource "google_bigquery_routine" "dlp_deidentify_text" {
  project      = google_project.project.project_id
  dataset_id   = google_bigquery_dataset.functions.dataset_id
  routine_id   = "dlp_deidentify_text"
  routine_type = "SCALAR_FUNCTION"

  definition_body = ""

  # Define function signature
  arguments {
    name      = "text_input"
    data_type = jsonencode({ typeKind = "STRING" })
  }

  return_type = jsonencode({ typeKind = "STRING" })

  remote_function_options {
    endpoint          = var.dlp_deidentify_service_cloud_run_url
    connection        = google_bigquery_connection.dlp_deidentify_service_conn.name
    max_batching_rows = 20
  }
}

resource "google_bigquery_connection_iam_binding" "dlp_deidentify_service_conn_binding" {
  project       = google_project.project.project_id
  location      = var.region
  connection_id = google_bigquery_connection.dlp_deidentify_service_conn.connection_id
  role          = "roles/bigquery.connectionUser"
  members = [
    "serviceAccount:${google_service_account.feedback_processing.email}",
    "serviceAccount:${google_service_account.feedback_processing_dev.email}"
  ]
}
