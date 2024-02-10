

# main.tf is for attaching the autoscaling group to the target group

# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = var.asg-name
  lb_target_group_arn    = var.tg-arn
}