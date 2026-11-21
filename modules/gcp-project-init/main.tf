terraform {
  required_version = ">= 1.17.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 8.8"
    }
  }
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = var.project_id
  folder_id       = var.folder_id
  billing_account = var.billing_account
  deletion_policy = var.prevent_destroy ? "PREVENT" : "DELETE"

  lifecycle {
    prevent_destroy = false
  }
}
