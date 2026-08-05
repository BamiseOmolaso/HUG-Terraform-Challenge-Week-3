variable "aws_region" {
  description = "AWS region where all resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Short name used as a prefix/tag on resources"
  type        = string
  default     = "hug-week3"
}

variable "full_name" {
  description = "Name shown on the Nginx landing page"
  type        = string
  default     = "Dr. Oluwabamise Omolaso"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for two public subnets in different AZs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for two private subnets in different AZs"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type for the web tier"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair in this region (for SSH)"
  type        = string
  default     = "terraform-key"
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH to the web instance (your public IP as x.x.x.x/32)"
  type        = string
}

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GiB"
  type        = number
  default     = 20
}

variable "db_storage_type" {
  description = "RDS storage type"
  type        = string
  default     = "gp3"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "hugapp"
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
  sensitive   = true
  default     = "hugadmin"
}

variable "db_password" {
  description = "Master password for the database (set in terraform.tfvars)"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Database port (MySQL 3306, Postgres 5432)"
  type        = number
  default     = 3306
}
