locals {
  project_id = "gds-bq-reporting"
}

terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-gds-bq-reporting"
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
  project = "gds-bq-reporting"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "gds-bq-reporting"
  project_name = "gds-bq-reporting"
}

module "scheduled_query_monitoring" {
  source = "../modules/scheduled-query-monitoring"

  project_id                      = "gds-bq-reporting"
  notification_email_address      = data.google_secret_manager_secret_version.slack_alert_channel_email_address.secret_data
  documentation_link_display_name = "Data Community Technical Documentation"
  documentation_link_url          = "https://docs.data-community.publishing.service.gov.uk/tools/google-cloud-platform/gcp-projects/#gds-bigquery-reporting"
}
