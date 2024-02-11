



# this output.tf will display the peering connection detials


output "vpc-peering-connection-id" {
    description = "this will display vpc's peering connection id"
    value = aws_vpc_peering_connection.peering-connection.id
}