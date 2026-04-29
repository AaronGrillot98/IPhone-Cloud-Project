# Architecture

## High-Level Flow

```text
Terraform Code
    ↓
GitHub Push / Pull Request
    ↓
GitHub Actions
    ↓
Terraform Format + Validate
    ↓
Checkov IaC Scan
    ↓
Gitleaks Secret Scan
    ↓
Python Report Tests
    ↓
Evidence Screenshots + Reports
```

## Components

| Component | Purpose |
|---|---|
| `terraform/insecure/` | Intentionally risky examples |
| `terraform/secure/` | Safer examples |
| `.github/workflows/` | CI/CD guardrail automation |
| `sample-data/security_findings.json` | Sample findings data |
| `src/report_builder.py` | Generates markdown report |
| `reports/` | Executive and remediation docs |
| `docs/` | Interview and setup documentation |
