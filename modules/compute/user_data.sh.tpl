#!/bin/bash
set -euo pipefail

yum update -y
yum install -y nginx

cat > /usr/share/nginx/html/index.html <<'EOT'
<html>
  <head><title>HUG Terraform Challenge</title></head>
  <body>
    <h1>${full_name}</h1>
    <p>HUG Lagos/Ibadan Terraform Challenge</p>
    <p>Week Three - Two-Tier Application</p>
  </body>
</html>
EOT

systemctl enable nginx
systemctl start nginx
