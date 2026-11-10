# =========================================================================
# 1. BIGQUERY CLOUD RESOURCE CONNECTION
# =========================================================================

resource "google_bigquery_connection" "feedback-bq-ml-connection" {
  project       = google_project.project.project_id
  location      = var.region
  connection_id = "feedback-bq-ml-connection"
  friendly_name = "BigQuery ML Remote Function Connector"
  description   = "BigQuery regional connection (europe-west2/London) to Vertex AI for Gemini model predictions."

  cloud_resource {}
}

# =========================================================================
# 2. IAM PERMISSIONS (INBOUND & OUTBOUND)
# =========================================================================

# INBOUND: Allow custom Service Accounts to use the BigQuery Connection
resource "google_bigquery_connection_iam_binding" "feedback-bq-ml-connection_binding" {
  project       = google_project.project.project_id
  location      = var.region
  connection_id = google_bigquery_connection.feedback-bq-ml-connection.connection_id
  role          = "roles/bigquery.connectionUser"
  members = [
    "serviceAccount:${google_service_account.feedback_processing.email}",
    "serviceAccount:${google_service_account.feedback_processing_dev.email}"
  ]
}

# OUTBOUND: Allow the BigQuery Connection's internal Google-managed Service Account to call Vertex AI
resource "google_project_iam_member" "bq_connection_vertex_user" {
  project = google_project.project.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_bigquery_connection.feedback-bq-ml-connection.cloud_resource[0].service_account_id}"
}

# Wait 30s for IAM propagation before executing the BigQuery CREATE MODEL job
resource "time_sleep" "wait_for_vertex_iam" {
  create_duration = "30s"

  depends_on = [
    google_project_iam_member.bq_connection_vertex_user,
    google_bigquery_connection_iam_binding.feedback-bq-ml-connection_binding
  ]
}

# =========================================================================
# 3. CREATE BIGQUERY ML GEMINI MODEL
# =========================================================================

locals {
  create_gemini_model_sql = <<-EOT
    CREATE OR REPLACE MODEL `${google_project.project.project_id}.govuk_feedback_processing_stg_s.feedback_bq_ml_gemini_model_london`
    REMOTE WITH CONNECTION `projects/${google_project.project.project_id}/locations/${var.region}/connections/${google_bigquery_connection.feedback-bq-ml-connection.connection_id}`
    OPTIONS (
      -- Pointing to the regional endpoint strictly enforces local ML processing in London
      ENDPOINT = 'https://${var.region}-aiplatform.googleapis.com/v1/projects/${google_project.project.project_id}/locations/${var.region}/publishers/google/models/gemini-3.5-flash'
    );
  EOT
}

resource "google_bigquery_job" "create_gemini_model" {
  project  = google_project.project.project_id
  location = var.region

  # Appending the MD5 hash triggers a new job ONLY if you modify the SQL above
  job_id = "create_gemini_model_${md5(local.create_gemini_model_sql)}"

  query {
    query = local.create_gemini_model_sql
  }

  depends_on = [
    time_sleep.wait_for_vertex_iam
  ]

  lifecycle {
    create_before_destroy = true
  }
}
