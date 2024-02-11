


# this main.tf is for creating internet gateway route for the vpc

resource "aws_route" "internet-gateway-route" {
  route_table_id            = var.route-table-id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = var.internet-gateway-id
}
