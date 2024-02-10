


# this main.tf for egress rule

resource "aws_vpc_security_group_egress_rule" "outbound" {
    security_group_id = var.security-group-id
    from_port = var.port
    to_port = var.port
    ip_protocol = var.protocol
    cidr_ipv4 = "0.0.0.0/0"
  
}