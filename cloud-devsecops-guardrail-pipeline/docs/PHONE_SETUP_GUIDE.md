# iPhone Setup Guide

This guide assumes you are building the project from an iPhone.

## Apps and Tools Needed

Install:

1. **GitHub Mobile**
2. **Working Copy**
3. **a-Shell**
4. **Files app**
5. **Safari**
6. **Koder or Textastic**, optional

Accounts:

1. **GitHub account** — required.
2. **AWS account** — optional later, not needed for Phase 1.

## Phase 1: No AWS Account Needed

Phase 1 is the safest beginner path. It uses GitHub Actions and Terraform example files only.

### Step 1 — Create Repo

Create a public GitHub repo named:

```text
cloud-devsecops-guardrail-pipeline
```

Screenshot:

```text
Screenshot 1: Empty GitHub repo page.
```

### Step 2 — Upload Project

Use Working Copy to move all project files into the repo.

Screenshot:

```text
Screenshot 2: Working Copy showing project folders.
```

### Step 3 — Local Test

In a-Shell:

```bash
cd cloud-devsecops-guardrail-pipeline
python -m pip install -r requirements.txt
python -m pytest tests/ -v
```

Screenshot:

```text
Screenshot 3: Python tests passing.
```

### Step 4 — Generate Report

```bash
python src/report_builder.py
```

Screenshot:

```text
Screenshot 4: Report builder output.
```

### Step 5 — Push

Commit and push all files.

Screenshot:

```text
Screenshot 5: Repo homepage on GitHub after push.
```

### Step 6 — Actions

Open the Actions tab.

Screenshot:

```text
Screenshot 6: Workflow list.
Screenshot 7: Python report tests passing.
Screenshot 8: Markdown check passing.
Screenshot 9: Terraform validate workflow.
Screenshot 10: IaC security scan workflow.
Screenshot 11: Secrets scan workflow.
```

## Phase 2: Optional AWS Learning

Only after Phase 1 is complete:

1. Create AWS free tier account.
2. Set a billing alert.
3. Do not deploy Terraform yet.
4. Explore IAM Access Analyzer, S3 Block Public Access, and CloudTrail concepts.
5. Add screenshots to `demo-evidence/`.

## Troubleshooting

### `python` does not work

Try:

```bash
python3 -m pytest tests/ -v
python3 src/report_builder.py
```

### GitHub Actions fail on Checkov insecure folder

That can be expected. The insecure folder is intentionally unsafe training material. The workflow uses it to demonstrate findings.

### Terraform asks for AWS credentials

Do not run `terraform apply`. This project is not meant to deploy in Phase 1.

### Reports folder does not show generated report

Run:

```bash
python src/report_builder.py
```


## Terraform workflow note

The Terraform workflow runs in GitHub Actions, not on your iPhone. It may take longer than the Python workflow because it installs Terraform and initializes provider metadata.

Do not run:

```bash
terraform apply
```

This project is for validation/scanning practice first, not cloud deployment.
