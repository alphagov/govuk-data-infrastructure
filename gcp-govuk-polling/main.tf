terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-govuk-polling"
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
  project = "govuk-polling"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id      = "govuk-polling"
  project_name    = "GOVUK Polling"
  project_owners  = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = ["group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk"]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}
