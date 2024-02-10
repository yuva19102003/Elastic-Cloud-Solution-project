

# this will get detials for the attachment of autoscaling and target group

variable "asg-name" {
    description = "the na,e of the autoscalinng group"
    type = string
}

variable "tg-arn" {
    description = "the arn of the target group"
    type = string
}