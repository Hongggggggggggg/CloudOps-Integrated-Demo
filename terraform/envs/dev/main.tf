locals {
  public_subnets_map  = { for idx, id in module.vpc.public_subnet_ids  : idx => id }
  private_subnets_map = { for idx, id in module.vpc.private_subnet_ids : idx => id }
}

module "vpc" {
    source = "../../modules/vpc"
    vpc_cidr       = var.vpc_cidr
    vpc_name       = var.vpc_name
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
    public_azs     = var.public_azs
    private_azs    = var.private_azs  
}

module "nat_instance" {
    source = "../../modules/nat-instance"
    ami_id        = var.ami_id
    instance_type = var.instance_type
    subnet_id     = module.vpc.public_subnet_ids[0]
    key_name      = var.demo_key_pair
    name          = "demo-nat-instance"
}

module "web_ec2" {
  source  = "../../modules/ec2"
  for_each = local.public_subnets_map

  template_name               = "web-template"
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.demo_key_pair
  subnet_id                   = each.value
  security_group_ids          = [module.vpc.public_security_group_id]
  iam_instance_profile_name   = module.iam.instance_profile_name
  associate_public_ip         = true
  user_data                   = var.user_data_web
  instance_name               = "demo-web-${each.key}"
}

module "app_ec2" {
  source  = "../../modules/ec2"
  for_each = local.private_subnets_map

  template_name               = "app-template"
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.demo_key_pair
  subnet_id                   = each.value
  security_group_ids          = [module.vpc.private_security_group_id]
  iam_instance_profile_name   = module.iam.instance_profile_name
  associate_public_ip         = false
  user_data                   = var.user_data_app
  instance_name               = "demo-app-${each.key}"
}

module "rds" {
  source            = "../../modules/rds"
  subnet_group_name = "demo-rds-subnet-group"
  subnet_ids        = module.vpc.private_subnet_ids
  db_identifier     = "demo-mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  username          = "adminuser"
  password          = "adminpassword"
  security_group_ids = [module.vpc.private_security_group_id]
}


module "s3" {
    source           = "../../modules/s3"
    bucket_name      = "demo-app-bucket"
    versioning_status = "Enabled"
}

module "iam" {
    source = "../../modules/iam"
    role_name = "demo-ec2-role"
    instance_profile_name = var.iam_instance_profile_name
}
