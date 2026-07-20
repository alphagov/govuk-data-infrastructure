output "notification_channel_name" {
  description = "The generated monitoring notification channel name."
  value       = google_monitoring_notification_channel.notification_email.name
}
