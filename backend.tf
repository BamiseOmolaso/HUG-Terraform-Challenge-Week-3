# Remote state in S3 with native locking (Terraform >= 1.10).
# Bucket created out-of-band (versioning on, block public access, SSE-S3).
# Docs: https://developer.hashicorp.com/terraform/language/settings/backends/s3
# Key is week-3 specific so it does not overwrite week-2 state.
terraform {
  backend "s3" {
    bucket       = "hug-tf-state-827327671360"
    key          = "hug-week-3/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
