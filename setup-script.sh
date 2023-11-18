#!/bin/bash
# sudo git clone https://github.com/Defmon3/linux-scripts && sudo mv linux-scripts/* . && sudo bash setup-script.sh


set -euo pipefail  # Enable strict error handling
set -x # Enable command tracing for debugging
export DEBIAN_FRONTEND=noninteractive
pip install requests

sudo python3 setup.py


#echo "########################################## Removing files and directories ##############################################" > /dev/null 2>&1
#dirs_to_remove=("Documents" "Music" "Pictures" "Public" "Templates" "Videos" "linux-scripts")
#for dir in "${dirs_to_remove[@]}"; do
#    echo "Removing $dir..."
#    rm -rf "$dir" > /dev/null 2>&1
#    echo "Removed $dir."
#done

#if ! [ -d "proj" ]; then
#  mkdir -p "proj"
#fi

#echo "#####################################################    END    #########################################################" > /dev/null 2>&1
#echo ""
#echo ""
#echo "########################################## Running update and upgrade ###################################################" > /dev/null 2>&1
#sudo apt -q update && sudo apt -q upgrade
#echo "#####################################################    END    #########################################################" > /dev/null 2>&1
#echo ""
#echo ""


#packages_to_install=("terminator" "netcat-traditional")
#for package in "${packages_to_install[@]}"; do
#    sudo apt install "$package" -y -q
#done
#echo "#####################################################    END    #########################################################" > /dev/null 2>&1
#echo ""
#echo ""

#print_section "Changing default shell to zsh"
#sudo chsh -s "$(which zsh)"
#echo ""

# Run additional scripts
bash wordlists.sh
bash proton.sh
bash xmind.sh
bash fix_postgres.sh
bash burp_pro.sh

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
