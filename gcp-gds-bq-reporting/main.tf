locals {
  project_id = "gds-bq-reporting"
}

terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
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
  allow_list = [
    "66869a14-0000-2576-92ed-c82add77914c", # Content data checker
    "67234dfd-0000-2f85-9ef3-14c14ef19c68", # partition_flat_checker
    "66616cd0-0000-2ed7-b95a-14223bba1176", # raw_data_table_checker
  ]
}
