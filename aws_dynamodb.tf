resource "aws_dynamodb_table" "terraform_state_locks" {
  count            = local.enable_dynamodb_locking ? 1 : 0
  name             = local.dynamodb_table_name
  billing_mode     = local.dynamodb_billing_mode
  hash_key         = "LockID"
  stream_enabled   = local.enable_dynamodb_pitr
  stream_view_type = local.enable_dynamodb_pitr ? "NEW_AND_OLD_IMAGES" : null

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = local.enable_dynamodb_pitr
  }

  tags = {
    Name        = "Terraform State Locks Table"
    Environment = local.environment
    ManagedBy   = "Terraform"
  }
}