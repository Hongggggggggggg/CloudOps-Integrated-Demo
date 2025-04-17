resource "aws_instance" "nat" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name = var.key_name
    associate_public_ip_address = true
    source_dest_check = false # Disable source/destination check for NAT instance

    tags = {
        Name = var.name
    }
}