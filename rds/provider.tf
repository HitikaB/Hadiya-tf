
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # backend "s3" {
  #   bucket         = "tf-backend-hitika"
  #   key            = "terraform.tfstate"
  #   region         = "ap-south-1"
  # }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  shared_config_files      = ["/home/neosoft/.aws/config"]
  shared_credentials_files = ["/home/neosoft/.aws/credentials"]
}
