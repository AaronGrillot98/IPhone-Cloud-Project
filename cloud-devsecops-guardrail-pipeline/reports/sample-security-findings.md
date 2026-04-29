# Sample Security Findings

## FINDING-001 — S3 public access controls disabled

Severity: High

Risk: A storage bucket could be exposed publicly.

Remediation: Enable S3 Block Public Access and review bucket policies.

## FINDING-002 — SSH open to the internet

Severity: High

Risk: Attackers can attempt remote access from anywhere.

Remediation: Restrict SSH to approved CIDR ranges.

## FINDING-003 — Wildcard IAM permissions

Severity: Critical

Risk: Compromised credentials could have broad account impact.

Remediation: Replace wildcard permissions with least privilege.
