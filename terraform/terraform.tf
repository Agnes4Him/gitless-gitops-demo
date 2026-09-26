terraform {
  required_version = ">= 1.15.0" 
  
  required_providers {
    aws = {
      version = "5.50.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {}