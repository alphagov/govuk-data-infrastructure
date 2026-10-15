variable "region" {
  description = "The default region to use for resources that require a region."
  type        = string
  default     = "europe-west2"
}

variable "dlp_deidentify_service_cloud_run_url" {
  description = "The URL of the DLP Deidentify Service Cloud Run service."
  type        = string
  default     = "https://dlp-deidentify-service-19513753240.europe-west2.run.app"
}
