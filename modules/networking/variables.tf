variable "vpc_id" {
  description = "ID of the VPC to attach networking resources to"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the two public subnets (different AZs)"
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "Exactly two public subnet CIDRs are required."
  }
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the two private subnets (different AZs)"
  type        = list(string)

  validation {
    condition     = length(var.private_subnet_cidrs) == 2
    error_message = "Exactly two private subnet CIDRs are required."
  }
}

variable "project_name" {
  description = "Short name used as a prefix/tag on resources"
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
  default     = {}
}
