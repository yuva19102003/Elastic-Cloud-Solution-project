


# this output.tf will display the outputs and values of the main.tf


output "vpc-id" {

    description = "display vpc id"
    value = aws_vpc.main.id
  
}

output "public-subnet-id" {

    description = "display public subnet id"
    value = aws_subnet.public-subnet[*].id
  
}


output "private-subnet-id" {

    description = "display private subnet id"
    value = aws_subnet.private-subnet[*].id
  
}

output "internet-gateway-id" {

    description = "display internet gateway"
    value = aws_internet_gateway.igw.id
  
}