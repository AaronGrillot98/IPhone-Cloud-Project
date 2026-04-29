# Threat Model

## Assets

- Cloud storage buckets
- IAM policies
- Network access rules
- CI/CD workflows
- Repository secrets
- Infrastructure code

## Threats

| Threat | Example | Impact |
|---|---|---|
| Public storage | S3 bucket exposed | Data leak |
| Overly broad IAM | `Action: "*"` | Account compromise blast radius |
| Open admin access | SSH from `0.0.0.0/0` | Brute force and exploitation attempts |
| Secret leakage | API key committed | Unauthorized access |
| Weak review process | No CI checks | Bad infrastructure reaches production |

## Controls

- IaC scanning
- secret scanning
- Terraform validation
- least privilege documentation
- remediation reports
- pull request review
