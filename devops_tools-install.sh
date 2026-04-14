# -----------------------
# Install Helm - Kubernetes package manager
# -----------------------
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# -----------------------
# Install AWS CLI (if using AWS)
# -----------------------
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# -----------------------
# Install Azure CLI (optional)
# -----------------------
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# -----------------------
# Install Google Cloud CLI (optional)
# -----------------------
sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg \
| sudo apt-key add -
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" \
| sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update -y
sudo apt-get install -y google-cloud-cli

# -----------------------
# Install Terraform - Infrastructure as Code
# -----------------------
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg \
| gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
| sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform

# -----------------------
# Install Python & Pip (for scripting / automation)
# -----------------------
sudo apt install -y python3 python3-pip

# -----------------------
# Install Node.js (for dev tools & CLI apps)
# -----------------------
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# -----------------------
# Install VS Code - IDE for DevOps coding
# -----------------------
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository \
"deb [arch=amd64] https://packages.microsoft.com/repos/code stable main"
sudo apt update -y && sudo apt install -y code

# -----------------------
# Install GNOME Extensions Support (GUI productivity)
# -----------------------
sudo apt install -y gnome-shell-extensions chrome-gnome-shell
# (Later you can install Clipboard Manager, Dash to Dock, Caffeine, etc.)

# -----------------------
# Cleanup unnecessary packages
# -----------------------
sudo apt autoremove -y   # Remove unused dependencies
sudo apt clean -y        # Clean package cache

echo "🎉 DevOps setup complete! Please reboot to apply Docker group permissions."
