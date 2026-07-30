resource "google_service_account" "scheduled_query_runner" {
  account_id   = "scheduled-query-runner"
  display_name = "Scheduled Query Runner"
  description  = "Service account used for automated scheduled query execution."
}
