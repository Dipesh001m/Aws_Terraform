variable "instance_type" {
  description = "What type of instance you want to create"
  type = string
  validation {
    condition = var.instance_type=="t2.micro" || var.instance_type=="t3.micro"
    error_message = "Only t2 and t3 micro allowed"
  }
}

variable "root_volume_size" {
  type = number
  default = 20
}

variable "root_volume_type" {
  type = string
  default = "gp2"
}