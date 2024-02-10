


# this will store values for egress rule

variable "security-group-id" {
    description = "security group id"
    type = string
}

variable "port" {
    description = "form port and in port"
    type = number
}

variable "protocol" {
    description = "protocol detials "
    type = string
}

