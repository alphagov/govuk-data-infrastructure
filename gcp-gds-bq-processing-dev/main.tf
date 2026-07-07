terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-gds-bq-processing-dev"
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
  project = "gds-bq-processing-dev"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "gds-bq-processing-dev"
  project_name = "gds-bq-processing-dev"
  project_owners = [
    "group:gcp-gds-bq-processing-dev-owners@digital.cabinet-office.gov.uk",
  ]
  project_editors = [
    "group:gcp-gds-bq-processing-dev-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:912027178151-compute@developer.gserviceaccount.com",
  ]
  project_viewers = ["group:gcp-gds-bq-processing-dev-viewers@digital.cabinet-office.gov.uk"]
}

module "scheduled_query_monitoring" {
  source = "../modules/scheduled-query-monitoring"

  project_id                      = "gds-bq-processing-dev"
  notification_email_address      = data.google_secret_manager_secret_version.slack_alert_channel_email_address.secret_data
  documentation_link_display_name = "Confluence Documentation"
  documentation_link_url          = "https://gov-uk.atlassian.net/wiki/spaces/GIAT/pages/5283676161/GA4+DataForm+Dev+Prod+Environment+set+up+and+Configuration"
}
