variable "aws_region" {
  description = "AWS region used for validation only. This training project should not be deployed."
  type        = string
  default     = "us-east-1"
}

variable "admin_cidr" {
  description = "Training CIDR block for restricted admin access."
  type        = string
  default     = "10.0.0.0/24"
}
