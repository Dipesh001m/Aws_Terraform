terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

locals {
  users_data = file("./users.yaml")
}

output "output" {
  value = local.users_data
}

