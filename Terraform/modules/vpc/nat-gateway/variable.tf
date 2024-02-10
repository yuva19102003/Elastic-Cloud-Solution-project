


# this variable.tf contains input values for main.tf


/*

variable "nat_gateways" {
  type = list(object({
    public_subnet_id   = string
    eip_allocation_id  = string
    nat_gateway_name   = string
    eip_name           = string
  }))
}

variable "eip-count" {
    description = "count of eip for nat-gw"
    type = list(string)
  
}
*/


# modules/nat_gateways/variables.tf



variable "nat-gw-public-subnet" {
    description = "public subnet for nat gateway"
    type = list(string) 
}