provider "aws" {
  region = var.aws["region"]
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.41.0"
    }
  }
  required_version = "1.2.3"
}