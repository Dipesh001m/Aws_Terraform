terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_ami" "name" {
  most_recent = true
  owners = ["amazon"]
}

output "aws_ami" {
  value = data.aws_ami.name.id
}


resource "aws_instance" "myserver" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"

    tags = {
      Name = "SampleServer"
    }
  
}