


# this output.tf will display the output of the main.terraform 


output "target-group-id" {
    description = "target group id"
    value = aws_lb_target_group.target-group.id
}

output "target-group-arn" {
    description = "target group arn "
    value = aws_lb_target_group.target-group.arn
}

output "alb-dns-name" {
    description = "the dns name for the load balancer"
    value = aws_lb.application-load-balancer.dns_name
}