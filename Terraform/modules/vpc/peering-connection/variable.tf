


# this variable.tf will store the input values for the main.tf


variable "accepter-vpc-id" {
    description = "accepter vpc id's"
    type = string 
}

variable "requester-vpc-id" {
    description = "requester vpc id's"
    type = string
}