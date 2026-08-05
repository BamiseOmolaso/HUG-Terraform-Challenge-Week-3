# Tell Terraform which cloud to talk to, and which region to use.
# Credentials come from your environment (AWS CLI profile / env vars) — never hardcode keys here.
provider "aws" {
  region = var.aws_region
}
