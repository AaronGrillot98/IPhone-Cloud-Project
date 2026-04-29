# QA Report — Cloud DevSecOps Guardrail Pipeline

## Summary

This project was unpacked, inspected, tested, fixed where needed, and repackaged.

## Final Results

- Required files missing: `0`
- Markdown workflow referenced missing files: `0`
- Stale references to unrelated older projects: `0`
- Python compile check: `PASS`
- Python tests after fixes: `PASS`
- Report generator after fixes: `PASS`
- Generated report confirmed during QA: `True`

## Fixes Applied

```json
[
  "Added GITHUB_TOKEN env to the Gitleaks GitHub Action for more reliable workflow execution.",
  "Made Checkov scans portfolio-safe by allowing training findings without breaking the whole pipeline.",
  "Added a Terraform workflow note to the iPhone setup guide.",
  "Added beginner explanation that Checkov findings are expected for insecure training examples."
]
```

## JSON Validation

```json
{
  "sample-data/security_findings.json": true,
  "policies/iam-policy-examples/bad-wildcard-policy.json": true,
  "policies/iam-policy-examples/better-s3-read-policy.json": true
}
```

## Terraform Intent Checks

```json
{
  "insecure_has_public_access_false": true,
  "insecure_has_open_ssh": true,
  "insecure_has_wildcard_iam": true,
  "secure_blocks_public_access": true,
  "secure_has_encryption": true,
  "secure_has_versioning": true,
  "secure_uses_private_cidr": true
}
```

## Workflow Path Checks

```json
{
  "markdown_check_missing_paths": [],
  "terraform_matrix_missing_paths": []
}
```

## Python Test Output

```text
[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m                                                                    [100%][0m
[32m[32m[1m5 passed[0m[32m in 0.09s[0m[0m
```

## Report Generator Output

```text
Cloud Guardrail Report Generated
============================================
Findings loaded: 4
Output: reports/generated-guardrail-report.md
```

## Notes

The starter ZIP intentionally does not include `reports/generated-guardrail-report.md`. That file appears after running:

```bash
python src/report_builder.py
```

The Checkov workflow is configured for portfolio training. Findings in `terraform/insecure/` are expected and should be used as screenshot evidence for your GitHub README.
