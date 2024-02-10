


# this variable.tf will store the input values for the main.tf

variable "security-group-name" {
  description = "the name of the security group"
  type        = string
}



variable "vpc-id" {
  description = "the vpc-id for the security group"
  type        = string
}

variable "sg-tag" {
  description = "tag for the security group"
  type        = string
}


