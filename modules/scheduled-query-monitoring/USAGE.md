<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_documentation_link_display_name"></a> [documentation\_link\_display\_name](#input\_documentation\_link\_display\_name) | Display name for the documentation link in the alert policy. | `string` | n/a | yes |
| <a name="input_documentation_link_url"></a> [documentation\_link\_url](#input\_documentation\_link\_url) | URL for the documentation link in the alert policy. | `string` | n/a | yes |
| <a name="input_notification_email_address"></a> [notification\_email\_address](#input\_notification\_email\_address) | Email address that should receive alert notifications. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Google Cloud project ID where the alert policy will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_policy_name"></a> [alert\_policy\_name](#output\_alert\_policy\_name) | The generated monitoring alert policy name. |
| <a name="output_notification_channel_name"></a> [notification\_channel\_name](#output\_notification\_channel\_name) | The generated monitoring notification channel name. |
<!-- END_TF_DOCS -->