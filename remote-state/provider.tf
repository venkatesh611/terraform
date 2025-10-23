terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.16.0"
    }
  }
  backend "s3" {
    bucket = "terraform-86s-bucket"
    key = "remote-state-demo"
    region = "us-east-1"
    encrypt = true
    
  }
}
provider "aws" {
  region = "us-east-1"
}