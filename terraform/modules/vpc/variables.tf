variable "vpc_cidr" {
    description = "value of the VPC CIDR block"
    type = string
}

variable "vpc_name" {
  description = "value of the VPC name"
  type = string
}

variable "public_subnets" {
  description = "value of the public subnets"
  type = list(string)
}

variable "private_subnets" {
  description = "value of the private subnets"
  type = list(string)
}

variable "public_azs" {
  description = "value of the public availability zones"
  type = list(string)
}

variable "private_azs" {
  description = "value of the private availability zones"
  type = list(string)
}