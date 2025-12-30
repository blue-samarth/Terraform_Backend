provider "aws" {
  region = "ap-south-1"
  
  default_tags {
    tags = {
      Project     = "Sample VPC"
      ManagedBy   = "Terraform"
      Environment = "Testing"
    }
  }
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Sample-VPC-Testing"
  }
}