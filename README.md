The repo has terraform deployments for a number of Google Cloud Platform (GCP) projects managed by the GOV.UK Insights & Analytics team. 

# Development
Any proposed changes to resources will be run in Terraform Cloud in CI on push.

## Install pre-commit
It is advised to get set-up to run the pre-commits locally to avoid formatting issues before you commit.
**Using Homebrew (macOS):**
```bash
brew install pre-commit
```

**Using Pip (Python):**
```bash
pip install pre-commit
```

## Configure Pre-commit
```bash
pre-commit install
```

## Using a module
If you choose to use any of the modules under `modules/` in a project, be sure to also update the `trigger_patterns` in the workspace. This will make sure that the workspace triggers a run if any changes are made to that module.

For example, if you use the `scheduled-query-monitoring` module in a workspace you must also add that path to the trigger patterns in the [workspace configuration](https://github.com/alphagov/govuk-infrastructure/blob/main/terraform/deployments/tfc-configuration/gcp-projects.tf). E.g. for workspace `gcp-gds-looker`...

```hcl
module "gcp-gds-looker" {
  source = "github.com/alphagov/terraform-govuk-tfe-workspacer"

  ...
  trigger_patterns = [
    "/gcp-gds-looker/**/*",
    "/modules/scheduled-query-monitoring/**/*", <-- add this
  ]
  ...
}
```
