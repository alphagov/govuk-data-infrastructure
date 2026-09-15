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

variable "allow_list" {
  description = "A list of transfer config IDs to exclude from this alerting. This is useful if there are scheduled queries that have their own specific alerts and you do not want them duplicated by this module. The required transfer config ID is the final part of the resource identifier - for example resource identifier `projects/659461823838/locations/europe-west2/transferConfigs/67326a18-0000-28a7-90a2-ac3eb15d0240` has transfer config ID `67326a18-0000-28a7-90a2-ac3eb15d0240`"
  type        = list(string)
  default     = []
}
