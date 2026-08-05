variable "project_name" {
  description = "Short name used as a prefix/tag on resources"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the DB subnet group (at least two AZs)"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the database instance"
  type        = string
}

variable "db_engine" {
  description = "Database engine (e.g. mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0"
}

variable "db_instance_class" {
  description = "RDS instance class (e.g. db.t3.micro)"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage in GiB"
  type        = number
}

variable "db_storage_type" {
  description = "Storage type (gp2, gp3, etc.)"
  type        = string
  default     = "gp3"
}

variable "db_name" {
  description = "Name of the initial database"
  type        = string
  default     = "hugapp"
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
  default     = {}
}
