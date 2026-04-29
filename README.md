# Cloud DevSecOps Guardrail Pipeline (iPhone Built)

This project demonstrates a complete **DevSecOps pipeline** that detects insecure cloud infrastructure before deployment using automated security guardrails.

Built entirely from an iPhone using GitHub + Working Copy.

---

## 🚀 Project Overview

This pipeline enforces security checks on Terraform infrastructure by integrating:

- Automated testing (Python + pytest)
- Terraform validation
- Infrastructure security scanning (Checkov)
- Secret detection (Gitleaks)
- Report generation with actionable remediation steps

The goal is to simulate a **real-world cloud security pipeline** used in DevSecOps environments.

---

## 🧠 What Problem This Solves

Manual cloud reviews are:
- inconsistent
- slow
- error-prone

This pipeline ensures:

> Insecure infrastructure is detected automatically before deployment.

---

## ⚙️ Tech Stack

- Python (report generation + testing)
- Terraform (infrastructure as code)
- GitHub Actions (CI/CD pipeline)
- Checkov (IaC security scanning)
- Gitleaks (secret detection)

---

## 🔄 Pipeline Flow

1. Developer pushes Terraform code
2. GitHub Actions triggers workflows
3. Pipeline runs:
   - Python tests
   - Terraform validation
   - Security scans (Checkov)
   - Secret scan (Gitleaks)
4. Report is generated with findings + remediation

---

## 📸 Demo Evidence

### 🧪 Python Tests Passing
![Tests](screenshots/python-tests.png)

### 📊 Report Generation
![Report CLI](screenshots/report-cli.png)

### 📄 Generated Report Output
![Report Output](screenshots/report-output.png)

### 🛠 Terraform Validate Workflow
![Terraform](screenshots/terraform-validate.png)

### 🔍 IaC Security Scan (Checkov)
![Checkov](screenshots/checkov-scan.png)

### 🔐 Secrets Scan (Gitleaks)
![Gitleaks](screenshots/gitleaks-scan.png)

### ⚙️ GitHub Actions Pipeline Runs
![Actions](screenshots/actions-overview.png)

---

## 📄 Example Findings

The pipeline detects issues such as:

- Public S3 buckets
- Open SSH access to the internet
- Wildcard IAM permissions
- Missing encryption on storage

Each finding includes:

- Severity level
- Risk explanation
- Exact file source
- Remediation steps

---

## 🧠 Key Security Insight

This project demonstrates how:

> CI/CD pipelines can enforce security guardrails automatically, turning security from a manual process into a repeatable system.

---

## 🎯 Interview Talking Point

“I built a DevSecOps pipeline that scans Terraform infrastructure for misconfigurations like public storage, open SSH, and overly permissive IAM before deployment, and generates actionable security reports automatically.”

---

## 📦 Project Structure

github/workflows   → CI/CD pipelines
src/                → Python report logic
tests/              → pytest validation
terraform/          → secure vs insecure configs
reports/            → generated output
docs/               → documentation
screenshots/        → demo proof
