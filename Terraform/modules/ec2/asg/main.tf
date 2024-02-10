


# this main.tf is for auto scaling group and target group 

resource "aws_autoscaling_group" "autoscaling-group" {

    name = var.asg-name

    launch_configuration = var.template-id

    min_size = var.min
    max_size = var.max
    desired_capacity = var.desired-size

    health_check_type    = "EC2"
    health_check_grace_period = 300

    vpc_zone_identifier = var.vpc-subnets
    force_delete          = true

}

