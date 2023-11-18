#!/bin/bash

set -e
# Specific Java version to check
REQUIRED_JAVA_VERSION="1.8.0_391"  # Update this as needed
JAVA_INSTALL_DIR="/opt/java/jre1.8.0_391"  # Update this as needed

# Configurable variables
JRE_DOWNLOAD_URL="https://javadl.oracle.com/webapps/download/AutoDL?BundleId=249192_b291ca3e0c8548b5a51d5a5f50063037"
JRE_TAR_FILE="jre-8u301-linux-x64.tar.gz"
INSTALL_DIR="/opt/java"

# Function to check for a specific Java version in a custom directory
# Function to check for a specific Java version in a custom directory
check_java_version() {
    local java_bin="$1/bin/java"  # Path to the Java binary
    local required_version="$2"

    if [ -x "$java_bin" ]; then
        installed_version=$("$java_bin" -version 2>&1)
        echo "Installed Java version: $installed_version"
        if echo "$installed_version" | grep -q "$required_version"; then
            echo "Java version $required_version is found at $java_bin."
            return 0
        else
            echo "Java version at $java_bin does not match $required_version."
            return 1
        fi
    else
        echo "Java binary not found at $java_bin."
        return 1
    fi
}


# Check if the required Java version is already installed in the custom directory
echo "Checking for existing Java installation..."
if check_java_version "$JAVA_INSTALL_DIR" "$REQUIRED_JAVA_VERSION"; then
    echo "Required Java version is already installed. Exiting installation script."
    exit 0
fi

# If the required version is not installed, proceed with installation
echo "Proceeding with Java installation..."


if ! [ -f "$JRE_TAR_FILE" ]; then
    # Downloading JRE
    echo "Downloading Java Runtime Environment..."
    if ! wget "$JRE_DOWNLOAD_URL" -O "$JRE_TAR_FILE"; then
        echo "Failed to download JRE. Exiting."
        exit 1
    fi
fi

# Creating installation directory
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating installation directory at $INSTALL_DIR..."
    if ! mkdir -p "$INSTALL_DIR"; then
        echo "Failed to create installation directory. Exiting."
        exit 1
    fi
fi

# Moving and extracting JRE
echo "Installing JRE to $INSTALL_DIR..."
if ! mv "$JRE_TAR_FILE" "$INSTALL_DIR" || ! cd "$INSTALL_DIR"; then
    echo "Failed to move JRE tarball or change directory. Exiting."
    exit 1
fi

if ! tar zxvf "$JRE_TAR_FILE"; then
    echo "Failed to extract JRE. Exiting."
    exit 1
fi

if ! rm "$JRE_TAR_FILE"; then
    echo "Failed to remove the JRE tarball. Exiting."
    exit 1
fi

# Check if the required Java version is installed and working
echo "Checking for existing Java installation at $JAVA_INSTALL_DIR..."
if check_java_version "$JAVA_INSTALL_DIR" "$REQUIRED_JAVA_VERSION"; then
    echo "Java installation at $JAVA_INSTALL_DIR is working as expected."
else
    echo "Java installation check at $JAVA_INSTALL_DIR failed."
    exit 1
fi
echo "#################################   Java Installation complete.   #################################"
