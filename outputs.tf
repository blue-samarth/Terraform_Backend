output "s3_bucket_id" {
  description = "The ID (name) of the S3 bucket"
  value       = aws_s3_bucket.terraform_state.id
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.terraform_state.arn
}

output "s3_bucket_region" {
  description = "The region where the S3 bucket is located"
  value       = aws_s3_bucket.terraform_state.region
}

output "s3_bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = aws_s3_bucket.terraform_state.bucket_domain_name
}

output "s3_bucket_versioning_enabled" {
  description = "Whether versioning is enabled on the S3 bucket"
  value       = local.versioning_enabled
}

# DynamoDB Table Outputs
output "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  value       = local.enable_dynamodb_locking ? aws_dynamodb_table.terraform_state_locks[0].name : null
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table for state locking"
  value       = local.enable_dynamodb_locking ? aws_dynamodb_table.terraform_state_locks[0].arn : null
}

output "dynamodb_table_id" {
  description = "The ID of the DynamoDB table for state locking"
  value       = local.enable_dynamodb_locking ? aws_dynamodb_table.terraform_state_locks[0].id : null
}

output "dynamodb_pitr_enabled" {
  description = "Whether point-in-time recovery is enabled for the DynamoDB table"
  value       = local.enable_dynamodb_pitr
}

# Backend Configuration Outputs
output "terraform_backend_config" {
  description = "Backend configuration to use this state storage"
  value = {
    bucket         = aws_s3_bucket.terraform_state.id
    key            = "terraform.tfstate"
    region         = local.aws_region
    dynamodb_table = local.enable_dynamodb_locking ? aws_dynamodb_table.terraform_state_locks[0].name : null
    encrypt        = local.server_side_encryption
  }
}

# Project Information Outputs
output "project_name" {
  description = "The name of the project"
  value       = local.name
}

output "environment" {
  description = "The environment name"
  value       = local.environment
}

output "aws_account_id" {
  description = "The AWS account ID where resources are created"
  value       = local.aws_account_id
}

output "aws_region" {
  description = "The AWS region where resources are created"
  value       = local.aws_region
}