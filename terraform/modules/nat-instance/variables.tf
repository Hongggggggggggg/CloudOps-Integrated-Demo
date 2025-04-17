variable "ami_id" {
    description = "AMI ID for the NAT instance"
    type = string
}

variable "instance_type" {
    description = "Instance type for the NAT instance"
    type = string
    default = "t2.micro"
}

variable "subnet_id" {
    description = "Subnet ID for the NAT instance"
    type = string
}

variable "key_name" {
    description = "Key pair name for SSH access to the NAT instance"
    type = string
}

variable "name" {
    description = "Name tag for the NAT instance"
    type = string
}
