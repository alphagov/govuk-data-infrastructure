terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-blogs-ga4-analytics"
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
  project = "blogs-ga4-analytics"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id      = "blogs-ga4-analytics"
  project_name    = "Blogs-GA4-Analytics"
  project_owners  = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = ["group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk", "serviceAccount:635132702097-compute@developer.gserviceaccount.com"]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}
