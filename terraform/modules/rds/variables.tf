variable "subnet_group_name" {
    description = "Name of the RDS subnet group"
    type = string
}

variable "subnet_ids" {
    description = "List of subnet IDs for the RDS subnet group"
    type = list(string)
}

variable "db_identifier" {
    description = "Identifier for the RDS instance"
    type = string
}

variable "engine_version" {
    description = "Version of the database engine"
    type = string
    default = "8.0"
}

variable "instance_class" {
    description = "Instance class for the RDS instance"
    type = string
    default = "db.t2.micro"
}

variable "allocated_storage" {
    description = "Allocated storage for the RDS instance (in GB)"
    type = number
    default = 20
}

variable "username" {
    description = "Master username for the RDS instance"
    type = string
}

variable "password" {
    description = "Master password for the RDS instance"
    type = string
    sensitive = true
}

variable "security_group_ids" {
    description = "List of security group IDs for the RDS instance"
    type = list(string)
}