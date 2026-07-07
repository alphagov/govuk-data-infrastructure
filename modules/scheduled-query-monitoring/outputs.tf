output "notification_channel_name" {
  description = "The generated monitoring notification channel name."
  value       = google_monitoring_notification_channel.notification_email.name
}

output "alert_policy_name" {
  description = "The generated monitoring alert policy name."
  value       = google_monitoring_alert_policy.scheduled_query_monitoring.name
}
