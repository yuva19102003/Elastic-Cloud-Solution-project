


# this main.tf is for creating route table for the vpc

resource "aws_route_table" "route-table" {
  vpc_id = var.route-table-vpc-id
}