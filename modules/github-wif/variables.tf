variable "project_id" {
  description = "The Google Cloud project ID where resources will be created."
  type        = string
  # No default - must be provided by the calling configuration.
}

variable "pool_id" {
  description = "The desired ID for the Workload Identity Pool."
  type        = string
  default     = "github-pool"
}

variable "pool_display_name" {
  description = "Display name for the Workload Identity Pool."
  type        = string
  default     = "GitHub Actions Pool"
}

variable "provider_id" {
  description = "The desired ID for the Workload Identity Pool Provider."
  type        = string
  default     = "github-provider"
}

variable "provider_display_name" {
  description = "Display name for the Workload Identity Pool Provider."
  type        = string
  default     = "GitHub Actions Provider"
}

variable "sa_id" {
  description = "The desired ID for the Service Account (part before '@')."
  type        = string
  default     = "github-actions-sa"
}

variable "sa_display_name" {
  description = "The display name for the Service Account."
  type        = string
  default     = "GitHub Actions Runner SA"
}

variable "github_repository" {
  description = "The GitHub repository for which to allow impersonation (e.g., 'alphagov/govuk-social-data')."
  type        = string
  # No default - must be provided by the calling configuration.
}

variable "sa_project_roles" {
  description = "A list of project-level IAM roles to grant to the created Service Account (e.g., ['roles/storage.objectAdmin']). Leave empty to manage roles separately."
  type        = list(string)
  default     = []
}

variable "sa_permission_to_act_as" {
  description = "A list of service accounts which the service account created by this module (sa_id) may act as. Required to deploy some services without granting permission at the project-level."
  type        = list(string)
  default     = []
}
