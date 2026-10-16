output "dlp_connection_service_account" {
  description = "The Service Account email automatically created and used by the DLP deidentify BigQuery connection"
  value       = google_bigquery_connection.dlp_deidentify_service_conn.cloud_resource[0].service_account_id
}
