variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  version             = "~> 2.28.1"
  region              = "us-east-1"
  allowed_account_ids = ["893606095128"]
}

terraform {
  required_version = ">=0.12.9"
  backend "s3" {
    bucket         = "terraform-state-893606095128"
    dynamodb_table = "terraform_locks"
    encrypt        = true
    key            = "systems/serverless-project/terraform.tfstate"
    region         = "us-east-1"
  }
}
