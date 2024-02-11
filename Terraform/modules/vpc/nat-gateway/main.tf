


# this main.tf is for creating nat gateway in the public subnet

# creating elastic ip address for the nat gateway

resource "aws_eip" "nat" {
  count = length(var.nat-gw-public-subnet)
  tags = {
    Name = "eip-${var.nat-gw-public-subnet[count.index]}"
  }
}

# creating nat gateway using the public subnet id's

resource "aws_nat_gateway" "nat" {
  count         = length(var.nat-gw-public-subnet)
  subnet_id     = var.nat-gw-public-subnet[count.index]
  allocation_id = aws_eip.nat[count.index].id

  tags = {
    Name = "nat-gw-${var.nat-gw-public-subnet[count.index]}"
  }
}