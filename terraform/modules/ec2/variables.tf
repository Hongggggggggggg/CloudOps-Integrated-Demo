variable "template_name" {
    description = "Name prefix for the EC2 launch template"
    type = string
}

variable "image_id" {
    description = "AMI ID for the EC2 instance"
    type = string
}

variable "instance_type" {
    description = "Instance type for the EC2 instance"
    type = string
    default = "t2.micro"
}

variable "key_name" {
    description = "Key pair name for SSH access to the EC2 instance"
    type = string
}

variable "subnet_id" {
    description = "Subnet ID for the EC2 instance"
    type = string
}

variable "security_group_ids" {
    description = "List of security group IDs for the EC2 instance"
    type = list(string)
}

variable "associate_public_ip" {
    description = "Whether to associate a public IP address with the EC2 instance"
    type = bool
    default = false
}

variable "user_data" {
    description = "User data script for the EC2 instance"
    type = string
}

variable "instance_name" {
    description = "Name of the EC2 instance"
    type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM instance profile name for the EC2 instance"
  type        = string
}