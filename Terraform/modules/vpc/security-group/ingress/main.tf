


# this main.tf for config ingress rules

resource "aws_vpc_security_group_ingress_rule" "inbound" {

    security_group_id = var.security-group-id
    from_port = var.port
    to_port = var.port
    ip_protocol = var.protocol
    cidr_ipv4 = var.cidr-blocks
  
}