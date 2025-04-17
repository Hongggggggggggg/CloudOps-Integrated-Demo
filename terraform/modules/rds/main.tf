resource "aws_db_subnet_group" "rds_subnet_group" {
    name = var.subnet_group_name
    subnet_ids = var.subnet_ids

    tags = {
        Name = var.subnet_group_name
    }
}

resource "aws_db_instance" "rds_instance" {
    identifier = var.db_identifier
    engine = "mysql"
    engine_version = var.engine_version
    instance_class = var.instance_class
    allocated_storage = var.allocated_storage
    username = var.username
    password = var.password
    db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
    publicly_accessible = false
    skip_final_snapshot = true

    tags = {
        Name = var.db_identifier
    }
}