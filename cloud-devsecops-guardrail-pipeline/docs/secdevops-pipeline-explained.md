# SecDevOps Pipeline Explained

## What Is SecDevOps?

SecDevOps means security is built into the development and deployment process instead of being checked only at the end.

In this project:

```text
Developer writes Terraform
↓
GitHub Actions starts
↓
Terraform formatting and validation run
↓
Checkov scans Infrastructure as Code
↓
Gitleaks checks for secrets
↓
Python tests validate report logic
↓
Findings and remediation are documented
```

## Why This Matters

Cloud mistakes can become real incidents:

- public data exposure
- overly broad permissions
- exposed admin ports
- leaked credentials
- inconsistent review process

A guardrail pipeline helps catch those issues before deployment.

## Aviation Maintenance Connection

Aviation maintenance uses inspections, procedures, and sign-offs to prevent unsafe operation.

This project uses the same idea:

```text
Pre-flight inspection → CI/CD pipeline
Maintenance discrepancy → security finding
Corrective action → remediation plan
Return to service → approved secure configuration
```
