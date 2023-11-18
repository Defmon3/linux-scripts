#!/bin/bash

#chmod +x setup-script.sh

# Initial upgrade
sudo apt update && sudo apt upgrade -y
pip install requests

# remove directories
rm -rf ~/Documents
rm -rf ~/Music
rm -rf ~/Pictures
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Videos
mkdir proj

#install git
sudo apt install git -y
sudo apt install -y terminator -y
sudo apt install netcat-traditional

wordlists.sh

#complex installations
proton.sh
xmind.sh
fix_postgres.sh


sudo apt install gvm

burp_pro.sh
sudo chsh -s $(which zsh)


