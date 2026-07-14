terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-govuk-content-data"
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
  project = "govuk-content-data"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "govuk-content-data"
  project_name = "govuk-content-data"
  project_owners = [
    "group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk",
    "serviceAccount:govuk-content-data-ga4@govuk-content-data.iam.gserviceaccount.com",
  ]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:760441133636-compute@developer.gserviceaccount.com",
    "serviceAccount:govuk-content-data@appspot.gserviceaccount.com",
  ]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}

module "scheduled_query_monitoring" {
  source = "../modules/scheduled-query-monitoring"

  project_id                      = "govuk-content-data"
  notification_email_address      = data.google_secret_manager_secret_version.slack_alert_channel_email_address.secret_data
  documentation_link_display_name = "Data Community Technical Documentation"
  documentation_link_url          = "https://docs.data-community.publishing.service.gov.uk/tools/google-cloud-platform/gcp-projects/#govuk-content-data"
}
