# modules/github-wif/outputs.tf

output "workload_identity_provider_name" {
  description = "The full resource name of the Workload Identity Pool Provider."
  # Example: projects/1234567890/locations/global/workloadIdentityPools/github-pool/providers/github-provider
  value = google_iam_workload_identity_pool_provider.github_provider.name
}

output "service_account_email" {
  description = "The email address of the created Service Account."
  value       = google_service_account.github_actions_sa.email
}

output "service_account_id" {
  description = "The unique ID of the created Service Account."
  value       = google_service_account.github_actions_sa.unique_id
}

output "service_account_name" {
  description = "The full name identifier of the created Service Account."
  # Example: projects/your-project-id/serviceAccounts/your-sa-id@your-project-id.iam.gserviceaccount.com
  value = google_service_account.github_actions_sa.name
}

output "workload_identity_pool_id" {
  description = "The ID of the workload identity pool created."
  value       = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
}

output "workload_identity_pool_provider_id" {
  description = "The ID of the workload identity pool provider created."
  value       = google_iam_workload_identity_pool_provider.github_provider.workload_identity_pool_provider_id
}
