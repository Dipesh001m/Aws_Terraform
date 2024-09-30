
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.62.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "myserver" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"

    tags = {
      Name = "Sample server"
    }
  
}