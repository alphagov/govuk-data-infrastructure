<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 8.8 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository) | The GitHub repository for which to allow impersonation (e.g., 'alphagov/govuk-social-data'). | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Google Cloud project ID where resources will be created. | `string` | n/a | yes |
| <a name="input_pool_display_name"></a> [pool\_display\_name](#input\_pool\_display\_name) | Display name for the Workload Identity Pool. | `string` | `"GitHub Actions Pool"` | no |
| <a name="input_pool_id"></a> [pool\_id](#input\_pool\_id) | The desired ID for the Workload Identity Pool. | `string` | `"github-pool"` | no |
| <a name="input_provider_display_name"></a> [provider\_display\_name](#input\_provider\_display\_name) | Display name for the Workload Identity Pool Provider. | `string` | `"GitHub Actions Provider"` | no |
| <a name="input_provider_id"></a> [provider\_id](#input\_provider\_id) | The desired ID for the Workload Identity Pool Provider. | `string` | `"github-provider"` | no |
| <a name="input_sa_display_name"></a> [sa\_display\_name](#input\_sa\_display\_name) | The display name for the Service Account. | `string` | `"GitHub Actions Runner SA"` | no |
| <a name="input_sa_id"></a> [sa\_id](#input\_sa\_id) | The desired ID for the Service Account (part before '@'). | `string` | `"github-actions-sa"` | no |
| <a name="input_sa_permission_to_act_as"></a> [sa\_permission\_to\_act\_as](#input\_sa\_permission\_to\_act\_as) | A list of service accounts which the service account created by this module (sa\_id) may act as. Required to deploy some services without granting permission at the project-level. | `list(string)` | `[]` | no |
| <a name="input_sa_project_roles"></a> [sa\_project\_roles](#input\_sa\_project\_roles) | A list of project-level IAM roles to grant to the created Service Account (e.g., ['roles/storage.objectAdmin']). Leave empty to manage roles separately. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email address of the created Service Account. |
| <a name="output_service_account_id"></a> [service\_account\_id](#output\_service\_account\_id) | The unique ID of the created Service Account. |
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | The full name identifier of the created Service Account. |
| <a name="output_workload_identity_pool_id"></a> [workload\_identity\_pool\_id](#output\_workload\_identity\_pool\_id) | The ID of the workload identity pool created. |
| <a name="output_workload_identity_pool_provider_id"></a> [workload\_identity\_pool\_provider\_id](#output\_workload\_identity\_pool\_provider\_id) | The ID of the workload identity pool provider created. |
| <a name="output_workload_identity_provider_name"></a> [workload\_identity\_provider\_name](#output\_workload\_identity\_provider\_name) | The full resource name of the Workload Identity Pool Provider. |
<!-- END_TF_DOCS -->