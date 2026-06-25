# Fastly

resource "google_dataform_repository" "fastly_processing" {
  provider = google-beta
  project  = google_project.project.project_id
  region   = "europe-west2"
  name     = "fastly_processing"

  git_remote_settings {
    url                                 = "https://github.com/alphagov/fastly-dataform"
    default_branch                      = "main"
    authentication_token_secret_version = "projects/${google_project.project.number}/secrets/dataform-git/versions/latest" # pragma: allowlist secret
  }

  service_account = google_service_account.data_processing.email
}

resource "google_dataform_repository_release_config" "production" {
  provider   = google-beta
  project    = google_project.project.project_id
  region     = "europe-west2"
  repository = google_dataform_repository.fastly_processing.name
  name       = "production"

  git_commitish = "main"
  cron_schedule = "0 7 * * *"
  time_zone     = "Etc/UTC"
}

resource "google_dataform_repository_workflow_config" "config" {
  provider       = google-beta
  project        = google_project.project.project_id
  region         = "europe-west2"
  repository     = google_dataform_repository.fastly_processing.name
  name           = "daily" # This isn't a great name but we need to import all existing settings
  release_config = google_dataform_repository_release_config.production.id

  cron_schedule = "0 8-14 * * *"
  time_zone     = "Etc/UTC"

  invocation_config {
    service_account                          = google_service_account.data_processing.email
    fully_refresh_incremental_tables_enabled = false
    transitive_dependencies_included         = false
    transitive_dependents_included           = false
    included_tags                            = []

    included_targets {
      database = "gds-bq-data"
      schema   = "govuk_weblogs"
      name     = "weblog_urls"
    }

    included_targets {
      database = "gds-bq-processing"
      schema   = "fastly_processing"
      name     = "fastly_processing"
    }

    included_targets {
      database = "gds-bq-processing"
      schema   = "fastly_processing"
      name     = "process_partition"
    }
  }
}

# GA4
resource "google_dataform_repository" "govuk_ga4_processing" {
  provider = google-beta
  project  = google_project.project.project_id
  region   = "europe-west2"
  name     = "govuk_ga4_processing"

  git_remote_settings {
    url                                 = "https://github.com/alphagov/ga4-dataform.git"
    default_branch                      = "main"
    authentication_token_secret_version = "projects/${google_project.project.number}/secrets/dataform-git/versions/latest" # pragma: allowlist secret
  }

  workspace_compilation_overrides {
    default_database = "gds-bq-processing-dev"
    schema_suffix    = ""
    table_prefix     = ""
  }

  service_account = google_service_account.data_processing_dev.email

}

# GA4 Aggregate Analytics
resource "google_dataform_repository_release_config" "aggregate_analytics_production" {
  provider   = google-beta
  project    = google_project.project.project_id
  region     = "europe-west2"
  repository = google_dataform_repository.govuk_ga4_processing.name
  name       = "aggregate-analytics-production"

  git_commitish = "IA-2955-aggregate-data"

  code_compilation_config {
    default_database = "ga4-aggregate-analytics"
    default_location = "europe-west2"

    # Overrides parameters in workflow_settings.yaml
    vars = {
      environment               = "dev"
      source_database           = "ga4-aggregate-analytics"
      source_ga4_prod_schema    = "analytics_123456789"
      processing_database       = "ga4-aggregate-analytics"
      processing_schema         = "govuk_ga4_processing"
      target_database           = "ga4-aggregate-analytics"
      target_flattened_dataset  = "govuk_ga4_processing"
      target_aggregated_dataset = "aggregated_dataset"
      start_date                = "20260617"
    }
  }
}
