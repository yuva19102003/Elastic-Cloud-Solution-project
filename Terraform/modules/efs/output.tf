


# this output.tf will display the ip address and dns name of the efs filesystem

output "efs-id" {
  value = aws_efs_file_system.efs-file-system.id
}

output "efs-dns-name" {
  value = aws_efs_file_system.efs-file-system.dns_name
}

output "efs-ip" {
  value = aws_efs_mount_target.efs-mount-target.ip_address
}