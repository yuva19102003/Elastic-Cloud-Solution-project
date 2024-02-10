

# main.tf for the target group and application load balancer

# target group
resource "aws_lb_target_group" "target-group" {
  name     = var.target-group-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
}

# application load balancer
resource "aws_lb" "application-load-balancer" {
  name               = var.alb-name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb-sg]
  subnets            = var.alb-subnet-id
}

# application load balancer listener

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.application-load-balancer.arn
  port = var.alb-listener-port
  protocol = var.alb-listener-protocol
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
  
}