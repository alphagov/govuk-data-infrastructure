output "github_workload_identity_provider_name" {
  description = "The full resource name of the Workload Identity Pool Provider connected to GitHub."
  value       = module.github_wif.workload_identity_provider_name
}

output "github_workload_identity_service_account_email" {
  description = "The email address of the Service Account connected to the Workload Identity Pool for GitHub."
  value       = module.github_wif.service_account_email
}
