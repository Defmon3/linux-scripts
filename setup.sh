#!/bin/bash
# sudo mkdir temp && cd temp && sudo git clone https://github.com/Defmon3/linux-scripts && sudo mv linux-scripts/* . && sudo bash setup.sh


set -euo pipefail  # Enable strict error handling
set -x # Enable command tracing for debugging
export DEBIAN_FRONTEND=noninteractive
pip install requests

sudo python3 setup.py

sudo rm -r setup.py


#print_section "Changing default shell to zsh"
#sudo chsh -s "$(which zsh)"
#echo ""

# Run additional scripts

#bash fix_postgres.sh
bash install_burp_pro.sh

# Change the default shell to zsh

# Perform system cleanup
#print_section "Performing system cleanup"
#sudo apt autoremove -y
#echo ""

# Unset DEBIAN_FRONTEND
unset DEBIAN_FRONTEND

# Install GVM
print_section "Installing GVM"
sudo apt install gvm -y
echo ""

# Script completed
echo "Script completed successfully."
