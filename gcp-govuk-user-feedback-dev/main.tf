terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-govuk-user-feedback-dev"
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
  project = "govuk-user-feedback-dev"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id     = "govuk-user-feedback-dev"
  project_name   = "govuk-user-feedback-dev"
  project_owners = ["group:gcp-govuk-user-feedback-dev-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "serviceAccount:816273172614-compute@developer.gserviceaccount.com",
    "serviceAccount:data-engineering@govuk-user-feedback-dev.iam.gserviceaccount.com",
    "serviceAccount:data-engineering@govuk-user-feedback.iam.gserviceaccount.com",
    "serviceAccount:govuk-user-feedback-dev@appspot.gserviceaccount.com",
    "serviceAccount:govuk-user-feedback@appspot.gserviceaccount.com",
  ]
  project_viewers = []
}
