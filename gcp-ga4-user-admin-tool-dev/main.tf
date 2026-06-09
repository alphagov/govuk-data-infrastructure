terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-ga4-user-admin-tool-dev"
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
  project = "ga4-user-admin-tool-dev"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id     = "ga4-user-admin-tool-dev"
  project_name   = "GA4-user-admin-tool-dev"
  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:702275883917-compute@developer.gserviceaccount.com",
  ]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}
