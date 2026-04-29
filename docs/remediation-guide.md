# Remediation Guide

## Finding: Public S3 Access

Risk: data exposure.

Fix:

- enable S3 Block Public Access
- remove public ACLs
- review bucket policies
- document any exception

## Finding: SSH Open to Internet

Risk: remote attack surface.

Fix:

- restrict CIDR ranges
- use VPN or private access
- avoid direct public admin ports

## Finding: Wildcard IAM

Risk: excessive permissions.

Fix:

- replace `Action: "*"`
- replace broad `Resource: "*"` where possible
- use least privilege
- separate human and automation roles

## Finding: Missing Encryption

Risk: data protection gaps.

Fix:

- enable server-side encryption
- document key choices
- consider versioning and recovery needs
