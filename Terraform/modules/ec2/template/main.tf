


# this main.tf for lanch template and configuration



resource "aws_launch_configuration" "launch-template" {

  name_prefix = var.template-name

  image_id = var.template-ami
  instance_type = var.instance-type

  key_name = var.key-pairs

  iam_instance_profile = var.instance-profile

  security_groups = [var.template-sg]

  user_data = file(var.userdata)
  
  lifecycle {
    create_before_destroy = true
  }
}