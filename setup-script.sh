#!/bin/bash
# git clone https://github.com/Defmon3/linux-scripts && mv linux-scripts/* .
#chmod +x setup-script.sh
set -x
set -e
# Initial upgrade
echo "############################## Running update and upgrade ##################################"
sudo apt -q update && sudo apt -q upgrade -y
echo "########################################## END ##############################################"
echo ""

echo "############################## PIP Install ##################################"
pip install requests
echo "########################################## END ##############################################"
echo ""

echo "############################## Setting up directories ##################################"
# remove directories
rm -rf ~/Documents
rm -rf ~/Music
rm -rf ~/Pictures
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Videos
mkdir proj
echo "########################################## END ##############################################"
echo ""

#install git
echo "############################## Installing apps ##################################"
sudo apt install -y terminator -y
sudo apt install netcat-traditional
echo "########################################## END ##############################################"
echo ""

wordlists.sh

#complex installations
proton.sh
xmind.sh
fix_postgres.sh




burp_pro.sh
sudo chsh -s $(which zsh)
sudo apt autoremove -y
sudo apt install gvm


