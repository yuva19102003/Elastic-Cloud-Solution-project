


# this output.tf is for displaying the route table detials


output "route-table-id" {
    
    description = "this will display the route table id"
    value = aws_route_table.route-table.id
  
}