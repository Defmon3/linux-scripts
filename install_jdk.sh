#!/bin/bash

set -e

echo "Installing Oracle JDK 18 dependencies..."
if ! sudo apt-get install -y libc6-i386 libc6-x32; then
    echo "Failed to install dependencies. Exiting."
    exit 1
fi

# Configurable variables
JDK_DEB_URL="https://download.oracle.com/java/18/archive/jdk-18.0.2.1_linux-x64_bin.deb"
JDK_DEB_FILE="oracle-jdk-18-linux-x64.deb" # Change this to the actual file name

if ! [ -f "$JDK_DEB_FILE" ]; then
    # Downloading JDK 18 Debian package
    echo "Downloading Oracle JDK 18..."
    if ! wget "$JDK_DEB_URL" -O "$JDK_DEB_FILE"; then
        echo "Failed to download JDK. Exiting."
        exit 1
    fi
fi

# Installing JDK 18
echo "Installing Oracle JDK 18..."
if ! sudo dpkg -i "$JDK_DEB_FILE"; then
    echo "Failed to install JDK. Trying to fix broken installations."
    if ! sudo apt-get install -f; then
        echo "Failed to fix broken installations. Exiting."
        exit 1
    fi
    echo "Re-attempting JDK installation..."
    if ! sudo dpkg -i "$JDK_DEB_FILE"; then
        echo "Failed to install JDK. Exiting."
        exit 1
    fi
fi

# Cleaning up
echo "Cleaning up..."
if ! rm "$JDK_DEB_FILE"; then
    echo "Failed to remove the installation file."
    exit 1
fi

echo "Oracle JDK 18 installation complete."
