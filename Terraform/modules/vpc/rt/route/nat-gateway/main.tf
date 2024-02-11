

# this main.tf is for creating nat gateway route for the vpc

resource "aws_route" "nat-gateway-route" {
  route_table_id            = var.route-table-id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = var.nat-gateway-id
}
