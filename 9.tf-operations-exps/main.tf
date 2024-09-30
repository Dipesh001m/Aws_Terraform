terraform {}

# numeric list
variable "num_list" {
  type = list(number)
  default = [ 1,2,3,4,5 ]
}

# Object list of person
variable "Person_list" {
  type = list(object({
    fname = string
    lname = string
  }))
  default = [ {
    fname = "Dipesh"
    lname = "mandal"
  }, {
    fname = "palak"
    lname = "mishera"
  } ]
}


# Map 
variable "map_list" {
  type = map(number)
  default = {
    "one" = 1
    "two" = 2
    "three" = 3
  }
}

# calculations
locals {
  mul = 2*2
  add = 2+2

#double the list
double = [for num in var.num_list : num * 2]

#odd no. only
odd = [ for num in var.num_list : num if num % 2 != 0]

# to get only fname from the person list
fname_list = [for person in var.Person_list : person.fname]

#work with map
map_list = [for key, value in var.map_list : key]

# double map
double_map = {for key, value in var.map_list : key => value}
}

output "output" {
  value = local.double_map
}
