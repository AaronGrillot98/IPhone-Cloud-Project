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
# This folder intentionally contains insecure examples.
# Do not deploy this configuration.

resource "aws_s3_bucket" "public_training_bucket" {
  bucket = "training-public-bucket-example-do-not-deploy"

  tags = {
    Project = "Cloud DevSecOps Guardrail Pipeline"
    Status  = "Insecure training example"
  }
}

resource "aws_s3_bucket_public_access_block" "bad_public_access" {
  bucket = aws_s3_bucket.public_training_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_security_group" "open_ssh" {
  name        = "training-open-ssh"
  description = "Insecure training example allowing SSH from the internet"

  ingress {
    description = "INSECURE: SSH open to the world"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "Cloud DevSecOps Guardrail Pipeline"
    Status  = "Insecure training example"
  }
}

resource "aws_iam_policy" "overly_broad_policy" {
  name        = "training-overly-broad-policy"
  description = "INSECURE: Demonstrates wildcard IAM permissions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}
