


# this output.tf is for displaying lanch template detials

output "launch-template-id" {
    description = "id of the launch template"
    value = aws_launch_configuration.launch-template.id
  
}