# Interview Walkthrough

## 30-Second Version

I built a Cloud DevSecOps Guardrail Pipeline to show how security checks can be automated before cloud infrastructure is deployed. It uses GitHub Actions, Terraform examples, Checkov scanning, Gitleaks secret scanning, and Python report generation.

## 2-Minute Version

The project has intentionally insecure Terraform and safer Terraform examples. GitHub Actions acts as the CI/CD guardrail. It validates Terraform, scans Infrastructure as Code for cloud misconfigurations, runs secret scanning, and tests a Python report generator.

I built it this way because I am coming from DoD aviation maintenance, where checklists and inspections prevent operational risk. I wanted to show that I can apply that same safety mindset to cloud infrastructure.

## Key Skills to Mention

- GitHub Actions
- Terraform
- Infrastructure as Code
- Checkov
- secret scanning
- IAM least privilege
- S3 public access controls
- remediation reporting
- operational risk thinking
