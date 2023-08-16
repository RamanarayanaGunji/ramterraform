terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.12.0"
    }
  }
      backend "s3" {
            bucket = "user-state"
            key    =  "use"
            region = "us-east-1"
            dynamodb_table = "use-locked"
          }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}



