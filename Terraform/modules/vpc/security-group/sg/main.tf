

# this main.tf for creating security group for vpc

resource "aws_security_group" "security-group" {
  name        = var.security-group-name
  vpc_id      = var.vpc-id
  tags = {
    name = var.sg-tag
  }
}