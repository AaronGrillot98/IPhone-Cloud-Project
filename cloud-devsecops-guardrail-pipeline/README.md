# Cloud DevSecOps Guardrail Pipeline

A beginner-friendly, iPhone-compatible SecDevOps and cloud security portfolio project.

This project shows how a cloud team can use GitHub Actions as a security guardrail pipeline to scan Infrastructure as Code before cloud infrastructure is deployed.

The project is designed for someone moving from DoD aviation maintenance into cloud security or SecDevOps. It connects aviation-style checklist discipline, safety controls, and pre-flight inspection habits to cloud infrastructure guardrails.

> **Beginner safety note:** This project does not require you to deploy anything to AWS. The safest version runs entirely in GitHub using Terraform example files and GitHub Actions.

---

## What Problem This Solves

Cloud infrastructure can accidentally be written with insecure settings, such as:

- public storage buckets
- overly broad IAM permissions
- open SSH from the internet
- missing encryption
- weak deployment review processes
- secrets accidentally committed to code

This repo simulates a security pipeline that catches those problems before deployment.

---

## Skills Demonstrated

- GitHub Actions CI/CD
- Terraform / Infrastructure as Code
- Cloud security misconfiguration awareness
- Checkov Infrastructure as Code scanning
- Secret scanning with Gitleaks
- Terraform formatting and validation
- IAM policy review
- S3 public access risk
- Security group / firewall risk
- Remediation documentation
- Executive reporting
- Interview-ready project communication

---

## Project Structure

```text
cloud-devsecops-guardrail-pipeline/
├── README.md
├── START_HERE.md
├── requirements.txt
├── terraform/
│   ├── insecure/
│   └── secure/
├── policies/
│   ├── guardrail-rules.md
│   └── iam-policy-examples/
├── .github/
│   └── workflows/
├── src/
├── tests/
├── sample-data/
├── reports/
├── docs/
├── demo-evidence/
└── screenshots/
```

---

## Safe Beginner Path

You can complete Phase 1 with only:

- iPhone
- GitHub Mobile
- Working Copy
- Safari
- a-Shell
- Files app

No AWS account is required for Phase 1.

---

## Quick Start on iPhone

```bash
cd cloud-devsecops-guardrail-pipeline
python -m pip install -r requirements.txt
python -m pytest tests/ -v
python src/report_builder.py
```

The report generator creates:

```text
reports/generated-guardrail-report.md
```

---

## GitHub Actions Included

| Workflow | Purpose |
|---|---|
| `terraform-validate.yml` | Checks Terraform formatting and validates Terraform syntax |
| `iac-security-scan.yml` | Runs Checkov scans against secure and insecure training examples |
| `secrets-scan.yml` | Runs Gitleaks secret scanning |
| `python-report-tests.yml` | Runs Python tests for the report builder |
| `markdown-check.yml` | Confirms key documentation files exist |

---

## Why There Are Secure and Insecure Terraform Folders

The `terraform/insecure/` folder is intentionally bad training material. It exists so you can show that the security pipeline detects common cloud risks.

The `terraform/secure/` folder shows safer examples and should pass more security checks.

This is like an aviation maintenance inspection:

```text
Bad configuration found before operation
↓
Finding documented
↓
Remediation applied
↓
Safer configuration approved
```

---

## Screenshots to Add

After you publish to GitHub, add screenshots to `demo-evidence/`:

1. Repo homepage
2. GitHub Actions workflow list
3. Terraform validation passing
4. Checkov scan output
5. Gitleaks scan passing
6. Python tests passing
7. Generated guardrail report
8. Remediation guide
9. Executive summary

Then add those images to this README.

---

## Resume Bullet

Built a **Cloud DevSecOps Guardrail Pipeline** using GitHub Actions, Terraform, Checkov, Gitleaks, and Python reporting to scan cloud Infrastructure as Code for risky patterns such as public storage, overly broad IAM, exposed network access, and missing security controls before deployment.

---

## Interview Explanation

I built this project to show how my aviation maintenance background transfers into cloud security. In aviation, checklists and inspections catch problems before they become operational risk. This project applies that same mindset to cloud infrastructure. It uses GitHub Actions as a guardrail pipeline to inspect Terraform code before deployment, identify unsafe cloud patterns, and document remediation steps clearly.
