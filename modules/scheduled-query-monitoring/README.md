# scheduled-query-monitoring

This module creates a Google Cloud Monitoring alert policy for scheduled BigQuery queries and routes notifications to a configured email address.

It is designed for BigQuery Data Transfer Service scheduled queries and covers two failure modes:

- the transfer run completes with a failed state
- the transfer reports a permission or authorization issue that prevents the query from running

The module watches all BigQuery Data Transfer configurations in the target project, so new scheduled queries are included automatically without extra configuration.

## Usage

See [USAGE.md](./USAGE.md) for a complete list of all module inputs, outputs, and resource details.

```hcl
module "scheduled_query_monitoring" {
  source = "../modules/scheduled-query-monitoring"

  project_id                   = "my-project-id"
  notification_email_address   = "my-team-email@example.com"
  documentation_link_display_name = "Name of Confluence Page"
  documentation_link_url      = "https://link-to-confluence-page.gov.uk"
}
```
