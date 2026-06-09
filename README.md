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
