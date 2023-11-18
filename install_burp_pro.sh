#!/bin/bash
sudo apt-get update -y
sudo bash install_java.sh
sudo bash install_jdk.sh
# Get the home directory of the user who invoked sudo
if [ "$SUDO_USER" ]; then
    user_home=$(getent passwd "$SUDO_USER" | cut -d: -f6)
else
    user_home=$HOME
fi
downloads_dir="$user_home/Downloads"

echo "##########################  Downloading files ##########################"
echo ""
echo ""
if ! [ -f "${downloads_dir}/BurpSuitePro-cracked" ]; then
  echo "Downloading BurpSuitePro-cracked"

  git clone https://github.com/GTekSD/BurpSuitePro-1.7.37-and-2022.8.5-Cracked.git "${downloads_dir}/BurpSuitePro-cracked"
fi

python3 download.py
if ! [ -f "/opt/BurpSuitePro/BurpSuitePro" ]; then
  echo "Install Burp Suite Pro"
  echo "Install in /opt/BurpSuitePro/"
  echo "Press Next>Next>Next>Next"
  sh "${downloads_dir}/burpsuite_pro_linux_v2023_11_1_1.sh"
else
    echo "BurpSuitePro already installed, skipping this part"
    # Other commands to handle the case when the file exists
fi

echo "Move some files"
cp "${downloads_dir}/BurpSuitePro-cracked/BurpSuitePro_+_BurpBountyPro_v2.6.1_+_Extensions/BurpSuitePro-Crack/Config.Dr-FarFar" /opt/BurpSuitePro/
cp "${downloads_dir}/BurpSuitePro-cracked/BurpSuitePro_+_BurpBountyPro_v2.6.1_+_Extensions/BurpSuitePro-Crack/Dr-FarFar.jar" /opt/BurpSuitePro/

cp -r "${downloads_dir}/BurpSuitePro-cracked/BurpSuitePro_+_BurpBountyPro_v2.6.1_+_Extensions/Burp-Bounty-Pro" /opt/BurpSuitePro

/opt/BurpSuitePro/BurpSuitePro  &
nohup /opt/BurpSuitePro/BurpSuitePro > /dev/null 2>&1 &

echo "After opening drfarfar
1. Click on 'RUN'
2. Copy '[license Key] (Ctrl + A) >>>> (Ctrl + C)' paste it into (Ctrl + V) BurpSuitePro
3. Click 'Next'
4. Click on 'Manual Activalion'
5. 'Copy Request' paste it into drfarfar '[Activation Request]'
6. Copy '[Activation Responce]' click on 'Paste response' in BurpSuitePro
7. 'Next'
Finish"
cd "/opt/BurpSuitePro" || { echo "Failed to change directory to /opt/BurpSuitePro"; exit 1; }

sudo java -jar /opt/BurpSuitePro/Dr-FarFar.jar

echo "Copy the 'Loader command' from drfarfar"
echo '#!/bin/sh

"/opt/BurpSuitePro/jre/bin/java" "--add-opens=java.desktop/javax.swing=ALL-UNNAMED" "--add-opens=java.base/java.lang=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED" `"-javaagent:/opt/BurpSuitePro/Dr-FarFar.jar"` "-noverify" "-jar" "/opt/BurpSuitePro/burpsuite_pro.jar"

_Note: Updte -javaagent:Dr-FarFar.jar path_' > /opt/BurpSuitePro/BhurpSuthPhro

sudo chmod 777 /opt/BurpSuitePro/BhurpSuthPhro