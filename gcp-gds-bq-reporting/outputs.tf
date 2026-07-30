output "scheduled_query_runner_service_account_email" {
  value       = google_service_account.scheduled_query_runner.email
  description = "The email address of the scheduled-query-runner service account."
}
