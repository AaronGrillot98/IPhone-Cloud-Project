# Common Checkov Findings to Understand

These are common findings a beginner should be able to explain.

## Public S3 Access

Risk: data exposure.

Fix: enable S3 Block Public Access, review bucket policies, avoid public ACLs.

## Open SSH

Risk: attackers can attempt remote access from anywhere.

Fix: restrict admin access to approved CIDR ranges or use safer access patterns.

## Wildcard IAM

Risk: account or service compromise can become much more damaging.

Fix: use least privilege and specific actions/resources.

## Missing Encryption

Risk: data may not have the expected protection at rest.

Fix: enable server-side encryption and document key management decisions.
