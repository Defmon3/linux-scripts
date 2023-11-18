#!/bin/bash

#Install snapd
sudo apt install snapd -y
sudo service snapd start
sudo apt update
sudo snap install core
sudo snap install xmind
# Add /snap/bin to PATH in .bashrc, if not already added
if ! grep -q "/snap/bin" ~/.bashrc; then
    echo 'export PATH=$PATH:/snap/bin' >> ~/.bashrc
    echo 'PATH updated in ~/.bashrc, please re-source or start a new terminal session.'
fi
