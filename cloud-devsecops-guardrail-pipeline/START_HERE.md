# Start Here — Beginner Setup

This is the exact beginner-friendly order.

## What You Are Building

You are building a GitHub portfolio project called:

```text
cloud-devsecops-guardrail-pipeline
```

It demonstrates SecDevOps and cloud security skills using GitHub Actions, Terraform examples, Checkov scanning, Gitleaks secret scanning, and Python-generated reporting.

## Apps and Tools You Need

Install or use these:

1. **GitHub Mobile** — create and view your repo.
2. **Working Copy** — manage GitHub files from iPhone.
3. **a-Shell** — run Python tests locally on iPhone.
4. **Files app** — unzip and move folders.
5. **Safari** — use GitHub and read docs.
6. **Koder or Textastic**, optional — edit files more comfortably.
7. **GitHub account** — required.
8. **AWS account**, optional later only — not needed for Phase 1.

## Important Cost Safety

Do **not** deploy AWS resources yet. Phase 1 is a no-cloud-cost project.

If you later create an AWS account, set a billing budget alert first.

## Beginner Setup Order

### Step 1 — Unzip

Open the Files app and tap the ZIP once.

You should see:

```text
cloud-devsecops-guardrail-pipeline
```

### Step 2 — Create GitHub Repo

In GitHub Mobile or Safari, create a new public repo:

```text
cloud-devsecops-guardrail-pipeline
```

Use:

```text
Visibility: Public
README: No, because this project already has one
.gitignore: No
License: No, because this project already has one
```

### Step 3 — Move Files into Working Copy

Open Working Copy, clone your empty repo, then move all files from this project into the cloned repo folder.

Screenshot moment:

```text
Screenshot 1: Files app showing the project folder structure.
```

### Step 4 — Run Local Python Tests

In a-Shell:

```bash
cd cloud-devsecops-guardrail-pipeline
python -m pip install -r requirements.txt
python -m pytest tests/ -v
```

Screenshot moment:

```text
Screenshot 2: Tests passing in a-Shell.
```

### Step 5 — Generate the Report

```bash
python src/report_builder.py
```

Screenshot moment:

```text
Screenshot 3: Report generator output.
```

Then open:

```text
reports/generated-guardrail-report.md
```

Screenshot moment:

```text
Screenshot 4: Generated report file.
```

### Step 6 — Commit and Push

In Working Copy:

1. Select changed files.
2. Commit.
3. Use message:

```text
Initial commit: add cloud DevSecOps guardrail pipeline
```

4. Push.

Screenshot moment:

```text
Screenshot 5: GitHub repo homepage after push.
```

### Step 7 — Watch GitHub Actions

Open your repo on GitHub and tap **Actions**.

Wait for workflows to run.

Screenshot moments:

```text
Screenshot 6: GitHub Actions workflow list.
Screenshot 7: Python tests workflow passing.
Screenshot 8: Markdown check passing.
Screenshot 9: Checkov IaC scan output.
Screenshot 10: Gitleaks scan passing.
```

## What Good Looks Like

A recruiter should be able to open your repo and quickly see:

- clear README
- cloud security problem statement
- Terraform examples
- GitHub Actions workflows
- security scan evidence
- remediation reports
- executive summary
- interview notes
- screenshots


## Checkov findings are not automatically bad

This project includes intentionally insecure Terraform examples. Checkov findings in `terraform/insecure/` are expected.

For your portfolio, the point is to show:

```text
Finding detected
↓
Risk explained
↓
Remediation documented
↓
Safer example provided
```

Take screenshots of those findings and reference `docs/remediation-guide.md`.
