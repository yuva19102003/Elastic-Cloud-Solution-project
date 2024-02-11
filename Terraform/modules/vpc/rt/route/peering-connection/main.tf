

# this main.tf is for creating vpc peering connection route for the vpc

resource "aws_route" "peering-connection-route" {
  route_table_id            = var.route-table-id
  destination_cidr_block    = var.destination-cidr-block
  vpc_peering_connection_id = var.peering-connection-id
}