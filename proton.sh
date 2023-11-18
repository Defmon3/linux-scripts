#!/bin/bash

#install proton
sudo wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb
sudo apt-get install ./protonvpn-stable-release_1.0.3_all.deb -y -q
sudo apt-get install proton-vpn-gnome-desktop -y -q