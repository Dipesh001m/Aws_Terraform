
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.62.0"
    }
  }
  backend "s3" {
    bucket = "aws-s3-terraform-537152f7a251ea36"
    key = "backend.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myserver" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"

    tags = {
      Name = "SampleServer"
    }
  
}