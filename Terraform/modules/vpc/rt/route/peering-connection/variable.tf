

# this variable.tf is for store input for the main.tf

variable "route-table-id" {
    description = "input of route table id"
    type = string
}

variable "destination-cidr-block" {
    description = "cidr block of the destination"
    type = string
  
}
variable "peering-connection-id" {
    description = "vpc peering connection id"
    type = string
  
}