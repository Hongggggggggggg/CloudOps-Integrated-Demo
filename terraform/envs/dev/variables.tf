variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "public_subnets" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDRs for private subnets"
  type        = list(string)
}

variable "public_azs" {
  description = "List of Availability Zones (AZs) used for public subnets"
  type        = list(string)
}

variable "private_azs" {
  description = "List of Availability Zones used for private subnets"
  type        = list(string)
}

variable "demo_key_pair" {
  description = "Name of the Key Pair used for EC2"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "user_data_web" {
  description = "User Data for launching Web EC2 instance"
  type        = string
}

variable "user_data_app" {
  description = "User Data for launching Application layer EC2 instance"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM Instance Profile name for EC2"
  type        = string
}
