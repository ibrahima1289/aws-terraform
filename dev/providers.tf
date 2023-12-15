terraform {
  required_providers {
    aws = {
      source       = "hashicorp/aws"
      version      = "~> 4.0"
    }
  }

  required_version = ">= 1.2.0"
   
  backend "s3" {
    bucket     	   = "dev-aws-tfstate-12"
    key        	   = "state/dev-terraform.tfstate"
    region         = "us-east-1"
    encrypt    	   = false # Should be set to true
    # dynamodb_table = "dev_aws_lockid"
  }
}

provider "aws" {
  region = "us-east-1"
}