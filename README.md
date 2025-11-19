### Deploy Jenkins server and terraform 
### user data script t2.medium 
'''
#!/usr/bin/env bash
set -euo pipefail

# Install Jenkins and Terraform on Ubuntu 22.04/24.04
# Access Jenkins at http://<EC2-Public-IP>:8080

export DEBIAN_FRONTEND=noninteractive

# If running as root, no sudo needed
if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
  SUDO=""
else
  SUDO="sudo"
fi

echo "[INFO] Updating packages..."
$SUDO apt-get update -y
$SUDO apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https unzip fontconfig openjdk-17-jre

# -------------------------------
# Install Jenkins
# -------------------------------
echo "[INFO] Adding Jenkins repository..."
$SUDO install -m 0755 -d /etc/apt/keyrings
$SUDO curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key -o /etc/apt/keyrings/jenkins-keyring.asc
$SUDO chmod 0644 /etc/apt/keyrings/jenkins-keyring.asc
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | $SUDO tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "[INFO] Installing Jenkins..."
$SUDO apt-get update -y
$SUDO apt-get install -y jenkins

echo "[INFO] Starting Jenkins service..."
$SUDO systemctl enable --now jenkins
$SUDO systemctl status jenkins --no-pager || true

# -------------------------------
# Install Terraform
# -------------------------------
echo "[INFO] Installing Terraform..."
TERRAFORM_VERSION="1.9.8"  # Change to latest stable if needed
curl -fsSL https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip
unzip terraform.zip
$SUDO mv terraform /usr/local/bin/
rm terraform.zip

echo "[INFO] Verifying Terraform installation..."
terraform -version

echo "[INFO] Jenkins and Terraform installed successfully!"
echo "Access Jenkins at: http://<EC2-Public-IP>:8080"
'''
