variable "subnet_id" {
  description = "Public subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "security_group_id" {
  description = "Web security group ID to attach to the instance"
  type        = string
}

variable "project_name" {
  description = "Short name used as a prefix/tag on resources"
  type        = string
}

variable "full_name" {
  description = "Name shown on the Nginx landing page"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair in this region (for SSH)"
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
  default     = {}
}
