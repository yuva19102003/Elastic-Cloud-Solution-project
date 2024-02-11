


# this variable.tf is for geting input for main.tf 

variable "template-name" {
    description = "the name tag for the template"
    type = string
}

variable "template-ami" {
    description = "the ami id for the template"
    type = string
    default = "ami-0cf10cdf9fcd62d37"
}

variable "instance-type" {
    description = "the instance type for template"
    type = string
    default = "t2.micro"
}

variable "key-pairs" {
    description = "this key pair for the template"
    type = string
}

variable "template-sg" {
    description = "this security group is for template"
    type = string
}

variable "userdata" {
    description = "userdata file for the template"
    type = string
}

variable "instance-profile" {
    description = "the iam instance profile is for the template"
    type = string
}
