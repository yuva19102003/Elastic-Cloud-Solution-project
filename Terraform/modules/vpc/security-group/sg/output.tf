



# this output.tf will display the security group detials


output "security-group-id" {
  description = "it will display the security group id"
  value       = aws_security_group.security-group.id
}