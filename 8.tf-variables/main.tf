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


# creating EC2 Instance
resource "aws_instance" "myserver" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = var.instance_type

    root_block_device {
      delete_on_termination = true
      volume_size = var.root_volume_size
      volume_type = var.root_volume_type
    }

    tags = {
      Name = "SampleServer"
    }
  
}