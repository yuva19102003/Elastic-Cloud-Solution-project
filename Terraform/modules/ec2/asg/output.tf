


# the displaying the auto scaling group

output "asg-id-name" {
    description = "id-name for the autoscaling group id"
    value = aws_autoscaling_group.autoscaling-group.name
}

output "asg-id" {
    description = "id for the autoscaling group id"
    value = aws_autoscaling_group.autoscaling-group.id
}

output "asg-id-arn" {
    description = "arn for the autoscaling group"
    value = aws_autoscaling_group.autoscaling-group.arn
}

