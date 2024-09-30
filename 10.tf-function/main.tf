terraform{}

locals {
  value = "Hello world"
}

variable "string_list" {
  type = list(string)
  default = [ "serv1","serv2","serv3" ]
}

output "output" {
  #value = upper(local.value)
  #value = startswith(local.value,"Hello")
  #value = split(" ", local.value)
  #value = max(1,2,3,4,5)
  #value = length(var.string_list)
  #value = join(":",var.string_list)
  value = contains(var.string_list,"serv1")
}