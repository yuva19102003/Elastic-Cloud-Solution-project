


# this main.tf is for config the route table association with subnet and route table


resource "aws_route_table_association" "rt-association" {
  subnet_id      = var.rt-association-subnet-id
  route_table_id = var.rt-association-route-table-id
}