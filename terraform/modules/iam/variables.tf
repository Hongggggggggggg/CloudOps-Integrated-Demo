variable "role_name" {
  description = "IAM role name"
  type        = string
  default     = "demo-ec2-role"
}

variable "instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
  default     = "demo-ec2-instance-profile"
}
