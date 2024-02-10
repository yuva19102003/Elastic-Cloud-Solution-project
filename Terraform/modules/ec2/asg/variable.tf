


# storing the detials for the autoscaling

variable "template-id" {
    description = "the template id"
    type = string
}

variable "asg-name" {
    description = "the name for the autoscaling group"
    type = string
}

variable "min" {
    description = "the minimum size for the autoscaling"
    type = number
    default = 2
}

variable "max" {
    description = "the maximum size for the autoscaling"
    type = number
    default = 4
}

variable "vpc-subnets" {
    description = "the subnet for the autoscaling"
    type = list(string)
  
}

variable "desired-size" {
  description = "desired size of the auto scaling"
  type = number
}