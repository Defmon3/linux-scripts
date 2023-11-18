#!/bin/bash
set -euo pipefail  # Enable strict error handling

# Functions

print_section() {
    echo "########################################## $1 ##############################################" > /dev/null 2>&1
}

# Main Script

# Clone the Linux-scripts repository and move its contents to the current directory
# sudo git clone https://github.com/Defmon3/linux-scripts && sudo mv linux-scripts/* . && sudo bash setup-script.sh

# Make the setup-script.sh executable
# chmod +x setup-script.sh

# Enable command tracing for debugging
set -x

# Set DEBIAN_FRONTEND to noninteractive to make apt assume "yes" for prompts
export DEBIAN_FRONTEND=noninteractive

print_section "Setting up directories"
# Remove directories
#!/bin/bash
set -euo pipefail  # Enable strict error handling

print_section "Removing files and directories"
# Remove directories
dirs_to_remove=("Documents" "Music" "Pictures" "Public" "Templates" "Videos" "linux-scripts")
ls
print_section "END Removing files and directories"

# Create a "proj" directory
if ! [ -d "proj" ]; then
  mkdir -p "proj"
fi
echo ""

# Initial update and upgrade
print_section "Running update and upgrade"
sudo apt -q update && sudo apt -q upgrade
echo ""

# PIP Install
print_section "PIP Install"
pip install requests
echo ""

# Setting up directories


# Install applications
print_section "Installing apps"
packages_to_install=("terminator" "netcat-traditional")
for package in "${packages_to_install[@]}"; do
    sudo apt install "$package" -y -q
done
echo ""

# Run additional scripts
bash wordlists.sh
proton.sh
xmind.sh
fix_postgres.sh
burp_pro.sh

# Change the default shell to zsh
print_section "Changing default shell to zsh"
sudo chsh -s "$(which zsh)"
echo ""

# Perform system cleanup
print_section "Performing system cleanup"
sudo apt autoremove -y
echo ""

# Unset DEBIAN_FRONTEND
unset DEBIAN_FRONTEND

# Install GVM
print_section "Installing GVM"
sudo apt install gvm -y
echo ""

# Script completed
echo "Script completed successfully."
