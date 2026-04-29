# Guardrail Rules

These are the high-level guardrails this project demonstrates.

## Storage Guardrails

- S3 buckets should not be public by default.
- Public access block should be enabled unless there is a documented exception.
- Server-side encryption should be enabled.
- Versioning should be considered for recovery.

## Network Guardrails

- SSH should not be open to `0.0.0.0/0`.
- Admin ports should be restricted.
- Egress should be as limited as practical.

## IAM Guardrails

- Avoid `Action: "*"` unless there is an approved exception.
- Avoid `Resource: "*"` where resource-level permissions are available.
- Prefer least privilege.
- Separate human admin permissions from automation permissions.

## CI/CD Guardrails

- Run IaC scans before deployment.
- Run secret scanning before merge.
- Require review for infrastructure changes.
- Keep evidence of scans and remediation.
