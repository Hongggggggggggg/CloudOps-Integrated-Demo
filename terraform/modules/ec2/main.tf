resource "aws_launch_template" "ec2_template" {
    name_prefix = var.template_name
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    
    iam_instance_profile {
        name = var.iam_instance_profile_name
    }

    network_interfaces {
      subnet_id = var.subnet_id
      security_groups = var.security_group_ids
      associate_public_ip_address = var.associate_public_ip
    }

    user_data = base64encode(var.user_data)

    tag_specifications {
      resource_type = "instance"

      tags = {
        Name = var.instance_name
      }
    }
}

resource "aws_instance" "this" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip
  iam_instance_profile = var.iam_instance_profile_name
  user_data = var.user_data

  tags = {
    Name = var.instance_name
  }
}