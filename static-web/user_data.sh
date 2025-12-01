#!/bin/bash
set -e

apt-get update -y || yum update -y
apt-get install -y git nginx || yum install -y git nginx
apt install openjdk-17-jdk -y

echo "[3/5] Adding Jenkins apt repository and key..."
mkdir -p "${JENKINS_KEYRING_DIR}"
# download key (don't fail the whole script if download has transient issues — still continue)
wget -O "${JENKINS_KEYRING_DIR}/jenkins-keyring.asc" "${JENKINS_KEY_URL}" || true

# create sources list (idempotent)
echo "deb [signed-by=${JENKINS_KEYRING_DIR}/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  > "${JENKINS_LIST}" || true

apt update -y

echo "[4/5] Installing Jenkins..."
apt install -y jenkins

# Ensure Jenkins is enabled & started
systemctl enable --now jenkins


systemctl enable nginx
systemctl start nginx

rm -rf /var/www/html
git clone https://github.com/dalvipiyush07/static-website-project.git /var/www/html

chown -R www-data:www-data /var/www/html 2>/dev/null || chown -R nginx:nginx /var/www/html
chmod -R 755 /var/www/html

systemctl restart nginx

