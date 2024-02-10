



# stores values for the efs main.tf 

variable "creation-token" {
  description = "this is for efs creation token"
  type        = string
  default     = "efs"
}


variable "security-groups" {
  description = "The ID of the VPC in which to create the EFS"
  type        = string
}

variable "subnet-id" {
  description = "A list of subnet IDs in which to create the EFS"
  type        = string
}

variable "name" {
  description = "Name of the EFS file system"
  default     = "my-efs"
}

variable "performance-mode" {
  description = "EFS performance mode (generalPurpose or maxIO)"
  default     = "generalPurpose"
}

variable "throughput-mode" {
  description = "EFS throughput mode (bursting or provisioned)"
  default     = "bursting"
}


