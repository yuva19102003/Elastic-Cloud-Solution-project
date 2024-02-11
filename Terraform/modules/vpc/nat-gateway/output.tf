

# this output.tf for displaying the nat gateway detials



output "nat-gateway-id" {
    description = "nat gateway id's"
    value = aws_nat_gateway.nat[*].id
  
}