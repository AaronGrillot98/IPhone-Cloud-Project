terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# TRAINING ONLY:
# This folder is a safer example for validation and security scanning practice.

resource "aws_s3_bucket" "private_training_bucket" {
  bucket = "training-private-bucket-example-do-not-deploy"

  tags = {
    Project = "Cloud DevSecOps Guardrail Pipeline"
    Status  = "Safer training example"
  }
}

resource "aws_s3_bucket_public_access_block" "good_public_access" {
  bucket = aws_s3_bucket.private_training_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.private_training_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.private_training_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_security_group" "restricted_admin" {
  name        = "training-restricted-admin"
  description = "Safer training example restricting admin access"

  ingress {
    description = "Restricted admin access for training CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    description = "HTTPS outbound"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "Cloud DevSecOps Guardrail Pipeline"
    Status  = "Safer training example"
  }
}

resource "aws_iam_policy" "least_privilege_read_policy" {
  name        = "training-least-privilege-read-policy"
  description = "Safer training example with limited S3 read permissions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.private_training_bucket.arn,
          "${aws_s3_bucket.private_training_bucket.arn}/*"
        ]
      }
    ]
  })
}
