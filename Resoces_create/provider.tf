#########################################################################################################
# file for terraform setting block
# created by sandeep kumar Patel
#########################################################################################################
# Terraform Settings Block
terraform {
  required_version = "~> 1.0"
  # Backend block for terraform state 
  # backend "s3" {
  #   bucket         = "ust-global-sandeep-kumar-patel-testing-s3-with-terraform"
  #   key            = "HttpdWebServer/terrafrom.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "value"
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region  = var.rgion
}