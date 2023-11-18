#!/bin/bash

#chmod +x setup-script.sh
: <<'END'
# Initial upgrade
sudo apt update && sudo apt upgrade -y
sudo apt install -y git vim curl terminator

#install proton
sudo wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb
sudo apt-get install ./protonvpn-stable-release_1.0.3_all.deb -y
sudo apt-get update
sudo apt-get install proton-vpn-gnome-desktop

#install xmind
# Install snapd
sudo apt install snapd -y

# Start snapd service
sudo service snapd start

# Install xmind
sudo snap install core xmind

# Add /snap/bin to PATH in .bashrc, if not already added
if ! grep -q "/snap/bin" ~/.bashrc; then
    echo 'export PATH=$PATH:/snap/bin' >> ~/.bashrc
    echo 'PATH updated in ~/.bashrc, please re-source or start a new terminal session.'
fi



# File path to the PostgreSQL configuration
config_file="/etc/postgresql/16/main/postgresql.conf"
backup_file="${config_file}.bak"

# Desired port number
new_port="5432"

# Check if the original configuration file exists
if [ -f "$config_file" ]; then
    # Create a backup of the original configuration file
    sudo cp "$config_file" "$backup_file"
    
    # Use 'sed' to search for the line containing 'port =' and replace it
    sudo sed -i "/^#*port =/c\port = $new_port" "$config_file"

    echo "PostgreSQL port changed to $new_port. Backup created at $backup_file."
else
    echo "Configuration file not found: $config_file"
fi

sudo systemctl restart postgresql
sudo apt install terminator -y
END

sudo apt install gvm



