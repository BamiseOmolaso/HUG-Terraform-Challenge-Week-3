# HUG Lagos/Ibadan Terraform Challenge — Week Three

Secure **two-tier** AWS environment with Terraform modules: public Nginx web tier and a private RDS database.

## Architecture

```
Internet
   │
   ▼
Internet Gateway
   │
   ├─ Public RT ──► Public subnet AZ-a ──► EC2 (Nginx) + NAT EIP
   │                 Public subnet AZ-b
   │
   └─ NAT Gateway
          │
          ▼
   Private RT ──► Private subnet AZ-a ┐
                  Private subnet AZ-b ├──► RDS MySQL (not public)
```

| Module | Creates |
|--------|---------|
| `modules/vpc` | VPC (`10.0.0.0/16`), DNS hostnames |
| `modules/networking` | 2 public + 2 private subnets (multi-AZ), IGW, NAT, public/private route tables |
| `modules/security_groups` | Web SG (HTTP :80 public, SSH from your IP); DB SG (only from web SG) |
| `modules/compute` | Amazon Linux 2023 EC2 + Nginx `user_data` HTML page |
| `modules/database` | RDS in private subnets, `publicly_accessible = false` |

State is stored remotely in S3 (`hug-week-3/terraform.tfstate`).

## Prerequisites

- Terraform `>= 1.14.0`
- AWS credentials (`aws sts get-caller-identity`)
- EC2 key pair in `us-east-1` (default name `terraform-key`)
- S3 backend bucket already available (same as Week Two)

## Deploy

```bash
cp terraform.tfvars.example terraform.tfvars
# Set ssh_cidr to YOUR_PUBLIC_IP/32  (curl -s ifconfig.me)
# Set a strong db_password

terraform init
terraform plan
terraform apply
terraform output website_url
```

Open the website URL. Wait ~1 minute after apply for Nginx `user_data`. RDS typically takes 5–10 minutes.

`terraform.tfvars` is gitignored.

## SSH

```bash
ssh -i ~/.ssh/terraform-key.pem ec2-user@$(terraform output -raw public_ip)
```

Only works from the IP in `ssh_cidr`. Use the same EC2 key pair (and local `.pem`) as previous weeks if it still exists in the region.

### When your public IP changes

Home / mobile IPs often change (router restart, ISP reassignment). That breaks SSH until you refresh `ssh_cidr` — HTTP on port 80 still works from anywhere.

1. Check your current public IP:
   ```bash
   curl -s ifconfig.me
   ```
2. Set `ssh_cidr` in `terraform.tfvars` to `YOUR_IP/32` (example: `203.0.113.45/32`).
3. Apply the security group update (no need to recreate the instance):
   ```bash
   terraform apply
   ```

Avoid leaving SSH open to `0.0.0.0/0`; prefer keeping `/32` and re-applying when your IP changes.

## Outputs

| Output | Meaning |
|--------|---------|
| `website_url` | Public HTML page |
| `vpc_id` | VPC for console screenshots |
| `instance_id` | EC2 instance |
| `db_instance_id` / `db_endpoint` | RDS (private; not open to the internet) |
| `public_subnet_ids` / `private_subnet_ids` | Networking |

## Cost note

**NAT Gateway** incurs hourly + data charges. Run `terraform destroy` when the demo is done.

## Screenshots

Add under `screenshots/` after a successful apply:

- VPC (subnets, IGW, NAT)
- EC2 running
- RDS running
- Webpage

## Cleanup

```bash
terraform destroy
```

## Write-up

LinkedIn post: thought process, tag **HUG Lagos** and **HUG Ibadan** (add link after posting).
