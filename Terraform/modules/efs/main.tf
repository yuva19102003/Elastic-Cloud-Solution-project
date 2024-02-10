


# this main.tf for efs 


resource "aws_efs_file_system" "efs-file-system" {  
  creation_token   = var.creation-token
  performance_mode = var.performance-mode
  throughput_mode  = var.throughput-mode
  encrypted        = "true"
  tags = {
    name = var.name
  }

}

resource "aws_efs_mount_target" "efs-mount-target" {
  file_system_id  = aws_efs_file_system.efs-file-system.id
  subnet_id       = var.subnet-id
  security_groups = [var.security-groups]


}