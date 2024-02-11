


# this variable.tf is for store input for the main.tf


variable "route-table-id" {
    description = "input of route table id"
    type = string
}

variable "nat-gateway-id" {
    description = "nat gateway id"
    type = string
  
}