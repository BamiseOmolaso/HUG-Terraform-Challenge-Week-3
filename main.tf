# Root module: two-tier app — public web + private database.
locals {
  common_tags = {
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "terraform"
    Challenge   = "HUG-Week-3"
  }
}

module "vpc" {
  source = "./modules/vpc"

  cidr_block   = var.vpc_cidr
  project_name = var.project_name
  tags         = local.common_tags
}

module "networking" {
  source = "./modules/networking"

  vpc_id               = module.vpc.vpc_id
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  project_name         = var.project_name
  tags                 = local.common_tags
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  ssh_cidr     = var.ssh_cidr
  db_port      = var.db_port
  tags         = local.common_tags
}

module "compute" {
  source = "./modules/compute"

  subnet_id         = module.networking.public_subnet_id
  security_group_id = module.security_groups.web_security_group_id
  project_name      = var.project_name
  full_name         = var.full_name
  instance_type     = var.instance_type
  key_name          = var.key_name
  tags              = local.common_tags
}

module "database" {
  source = "./modules/database"

  project_name         = var.project_name
  private_subnet_ids   = module.networking.private_subnet_ids
  security_group_id    = module.security_groups.db_security_group_id
  db_engine            = var.db_engine
  db_engine_version    = var.db_engine_version
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_storage_type      = var.db_storage_type
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  tags                 = local.common_tags
}
