resource "google_monitoring_notification_channel" "notification_email" {
  project      = var.project_id
  display_name = "Notification Email Channel"
  type         = "email"

  labels = {
    email_address = var.notification_email_address
  }
}

# Alert Policy for Scheduled Query run failures
resource "google_monitoring_alert_policy" "dts_failure_alert" {
  project      = var.project_id
  display_name = "CRITICAL: Scheduled Query Failure"
  combiner     = "OR"
  severity     = "CRITICAL"

  conditions {
    display_name = "Scheduled Query Failed"
    condition_threshold {
      filter          = "resource.type=\"bigquery_dts_config\" AND metric.type=\"bigquerydatatransfer.googleapis.com/transfer_config/completed_runs\" AND metric.labels.completion_state=\"FAILED\""
      duration        = "0s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0

      trigger {
        count = 1
      }

      aggregations {
        alignment_period   = "3600s"
        per_series_aligner = "ALIGN_COUNT"
      }
    }
  }

  documentation {
    content   = "One or more scheduled queries in this project failed. Review the affected transfer configuration and project permissions for details."
    mime_type = "text/markdown"
    subject   = "Scheduled Query Monitoring Alert"

    links {
      display_name = var.documentation_link_display_name
      url          = var.documentation_link_url
    }
  }

  notification_channels = [google_monitoring_notification_channel.notification_email.name]
}

# Alert Policy for Scheduled Query permissions issues
resource "google_monitoring_alert_policy" "dts_permissions_alert" {
  project      = var.project_id
  display_name = "CRITICAL: Scheduled Query Permission Issue"
  combiner     = "OR"
  severity     = "CRITICAL"

  conditions {
    display_name = "Scheduled query permission issue"

    condition_matched_log {
      filter = <<-EOT
        resource.type = "bigquery_dts_config"
        AND (
          jsonPayload.message =~ "permission"
          OR jsonPayload.message =~ "Permission"
          OR jsonPayload.message =~ "unauthorized"
          OR jsonPayload.message =~ "not authorized"
          OR jsonPayload.message =~ "forbidden"
        )
      EOT
    }
  }

  alert_strategy {
    notification_rate_limit {
      period = "3600s" // one every 24 hours
    }
    auto_close = "3600s" // close after 24 hours
  }

  documentation {
    content   = "One or more scheduled queries in this project could not run because of insufficient permissions. Review the affected transfer configuration and project permissions for details."
    mime_type = "text/markdown"
    subject   = "Scheduled Query Monitoring Alert"

    links {
      display_name = var.documentation_link_display_name
      url          = var.documentation_link_url
    }
  }

  notification_channels = [google_monitoring_notification_channel.notification_email.name]
}
