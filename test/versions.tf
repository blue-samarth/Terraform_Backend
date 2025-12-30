terraform {
  required_version = "~> 1.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.27.0"
    }
  }

  backend "s3" {
    bucket         = "samproj-development-tfstate-bucket-521713274292"
    key            = "test/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "samproj-development-tfstate-locks-table-521713274292"
    encrypt        = true
  }
}