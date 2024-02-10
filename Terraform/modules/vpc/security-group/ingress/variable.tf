


# this variable.tf for main.tf


variable "security-group-id" {
    description = "security group id"
    type = string
}

variable "port" {
    description = "from port and to port"
    type = number
}

variable "protocol" {
    description = "protocols for the security group"
    type = string
}

variable "cidr-blocks" {
    description = "cidr blocks for security groups"
    type = string
}