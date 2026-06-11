terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-govuk-user-feedback"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.33.0"
    }
  }

  required_version = "~> 1.15"
}

provider "google" {
  project = "govuk-user-feedback"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id     = "govuk-user-feedback"
  project_name   = "govuk-user-feedback"
  project_owners = ["group:gcp-govuk-user-feedback-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "serviceAccount:data-engineering@govuk-user-feedback.iam.gserviceaccount.com",
    "serviceAccount:1011669116237-compute@developer.gserviceaccount.com",
    "serviceAccount:data-engineering@govuk-user-feedback.iam.gserviceaccount.com",
  ]
  project_viewers = []
}
