# Remediation Plan

## Priority 1 — Identity

Replace wildcard IAM policies with least-privilege policies.

## Priority 2 — Network

Restrict admin ports and remove public SSH exposure.

## Priority 3 — Storage

Enable public access block, encryption, and versioning.

## Priority 4 — Pipeline

Run validation, IaC scanning, and secret scanning on every pull request.

## Priority 5 — Evidence

Save screenshots of GitHub Actions, findings, and remediation notes in `demo-evidence/`.
