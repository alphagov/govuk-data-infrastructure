resource "google_monitoring_notification_channel" "notification_email" {
  project      = var.project_id
  display_name = "Notification Email Channel"
  type         = "email"

  labels = {
    email_address = var.notification_email_address
  }
}

resource "google_monitoring_alert_policy" "scheduled_query_monitoring" {
  project      = var.project_id
  display_name = "CRITICAL: Scheduled Query Monitoring Alert"
  combiner     = "OR"
  severity     = "CRITICAL"

  conditions {
    display_name = "Scheduled query failed"

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

  conditions {
    display_name = "Scheduled query permission issue"

    condition_matched_log {
      filter = <<-EOT
        resource.type = "bigquery_dts_config"
        AND (
          protoPayload.status.message =~ "permission"
          OR protoPayload.status.message =~ "Permission"
          OR protoPayload.status.message =~ "unauthorized"
          OR protoPayload.status.message =~ "not authorized"
          OR protoPayload.status.message =~ "forbidden"
        )
      EOT
    }
  }

  alert_strategy {
    notification_rate_limit {
      period = "3600s"
    }
  }

  notification_channels = [google_monitoring_notification_channel.notification_email.name]

  documentation {
    content   = "One or more scheduled queries in this project failed or could not run because of insufficient permissions. Review the affected transfer configuration and project permissions for details."
    mime_type = "text/markdown"
    subject   = "Scheduled Query Monitoring Alert"

    links {
      display_name = var.documentation_link_display_name
      url          = var.documentation_link_url
    }
  }
}
