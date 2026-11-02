output "github_workload_identity_provider_name" {
  description = "The full resource name of the Workload Identity Pool Provider connected to GitHub."
  value       = module.github_wif.workload_identity_provider_name
}
