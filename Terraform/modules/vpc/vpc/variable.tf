


# this variable.tf contains input values for vpc.tf

variable "vpc-cidr-block" {

    description = "this variable contains vpc's cidr block"
    type = string
  
}

variable "vpc-name" {

    description = "this variable contains vpc's name"
    type = string
  
}


# variables.tf

variable "subnet-az" {

    description = "this variable contains list of subnets availability zones of vpc"
    type    = list(string)
}

variable "public-subnet-cidr-block" {
    
    description = "this variable contains list of public subnets cidr blocks of vpc"
    type    = list(string)
}

variable "private-subnet-cidr-block" {
    
    description = "this variable contains list of private subnets cidr blocks of vpc"
    type    = list(string)
}