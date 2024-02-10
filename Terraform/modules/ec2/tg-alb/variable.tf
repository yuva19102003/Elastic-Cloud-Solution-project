


# variable.tf for getting detials for the target group

# target group

variable "target-group-name" {
    description = "this will get the name of the target group"
    type = string
}

variable "vpc-id" {
    description = "this will get the vpc id for the target group"
    type = string
}


# application load balancer

variable "alb-name" {
    description = "the name for application load balancer"
    type = string
}

variable "alb-sg" {
    description = "the security group for the application load balancer"
    type = string
}

variable "alb-subnet-id" {
    description = "the public subnet for the application load balancer"
    type = list(string)
  
}

# application load balancer listener

variable "alb-listener-port" {
    description = "the listener port for the load balancer"
    type = number
}

variable "alb-listener-protocol" {
    description = "the protocol for the listener load balancer"
    type = string
}