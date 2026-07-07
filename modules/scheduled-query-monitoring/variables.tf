variable "project_id" {
  description = "The Google Cloud project ID where the alert policy will be created."
  type        = string
}

variable "notification_email_address" {
  description = "Email address that should receive alert notifications."
  type        = string
  sensitive   = true
}

variable "documentation_link_display_name" {
  description = "Display name for the documentation link in the alert policy."
  type        = string
}

variable "documentation_link_url" {
  description = "URL for the documentation link in the alert policy."
  type        = string
}
