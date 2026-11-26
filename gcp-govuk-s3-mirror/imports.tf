import {
  id = "govuk-s3-mirror"
  to = module.managed_project.google_project.project
}

import {
  id = "govuk-s3-mirror"
  to = google_compute_project_default_network_tier.default
}

import {
  id = "govuk-s3-mirror"
  to = google_project_iam_policy.project
}

import {
  id = "govuk-s3-mirror/storage.googleapis.com"
  to = google_project_service.services["storage.googleapis.com"]
}

import {
  id = "govuk-s3-mirror/iam.googleapis.com"
  to = google_project_service.services["iam.googleapis.com"]
}

import {
  id = "govuk-s3-mirror/pubsub.googleapis.com"
  to = google_project_service.services["pubsub.googleapis.com"]
}

import {
  id = "govuk-s3-mirror/sourcerepo.googleapis.com"
  to = google_project_service.services["sourcerepo.googleapis.com"]
}

import {
  id = "govuk-s3-mirror/storagetransfer.googleapis.com"
  to = google_project_service.services["storagetransfer.googleapis.com"]
}

import {
  id = "govuk-s3-mirror-tfstate"
  to = google_storage_bucket.backend
}

import {
  id = "govuk-s3-mirror-tfstate"
  to = google_storage_bucket_iam_policy.backend
}

import {
  id = "govuk-s3-mirror_govuk-database-backups"
  to = google_storage_bucket.govuk_database_backups
}

import {
  id = "govuk-s3-mirror_govuk-database-backups"
  to = google_storage_bucket_iam_policy.govuk_database_backups
}

import {
  id = "govuk-s3-mirror/6351057745806264635" # pragma: allowlist secret
  to = google_storage_transfer_job.govuk_database_backups
}

import {
  id = "govuk-s3-mirror_govuk-integration-database-backups"
  to = google_storage_bucket.govuk-integration-database-backups
}

import {
  id = "govuk-s3-mirror_govuk-integration-database-backups"
  to = google_storage_bucket_iam_policy.govuk-integration-database-backups
}

import {
  id = "govuk-s3-mirror/3250426811164964773" # pragma: allowlist secret
  to = google_storage_transfer_job.govuk-integration-database-backups
}

import {
  id = "projects/govuk-s3-mirror/topics/govuk-database-backups"
  to = google_pubsub_topic.govuk_database_backups
}

import {
  id = "projects/govuk-s3-mirror/topics/govuk-database-backups"
  to = google_pubsub_topic_iam_policy.govuk_database_backups
}

import {
  id = "govuk-s3-mirror_govuk-database-backups/notificationConfigs/2"
  to = google_storage_notification.govuk_database_backups
}

import {
  id = "projects/govuk-s3-mirror/subscriptions/govuk-database-backups"
  to = google_pubsub_subscription.govuk_database_backups
}

import {
  id = "govuk-s3-mirror_govuk-database-backups/notificationConfigs/13"
  to = google_storage_notification.govuk_user_feedback
}

import {
  id = "govuk-s3-mirror_govuk-database-backups/notificationConfigs/12"
  to = google_storage_notification.govuk_user_feedback_dev
}

import {
  id = "projects/govuk-s3-mirror/topics/govuk-integration-database-backups"
  to = google_pubsub_topic.govuk_integration_database_backups
}

import {
  id = "projects/govuk-s3-mirror/topics/govuk-integration-database-backups"
  to = google_pubsub_topic_iam_policy.govuk_integration_database_backups
}

import {
  id = "govuk-s3-mirror_govuk-integration-database-backups/notificationConfigs/9"
  to = google_storage_notification.govuk_integration_database_backups
}

import {
  id = "projects/govuk-s3-mirror/subscriptions/govuk-integration-database-backups"
  to = google_pubsub_subscription.govuk_integration_database_backups
}

import {
  id = "govuk-s3-mirror_govuk-integration-database-backups/notificationConfigs/17"
  to = google_storage_notification.support_api_backup_staging
}
