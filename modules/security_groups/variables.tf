variable "vpc_id" {
  description = "ID of the VPC for the security groups"
  type        = string
}

variable "project_name" {
  description = "Short name used as a prefix/tag on resources"
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH to the web instance (your IP as x.x.x.x/32)"
  type        = string
}

variable "db_port" {
  description = "Database port allowed from the web security group"
  type        = number
  default     = 3306
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
  default     = {}
}
