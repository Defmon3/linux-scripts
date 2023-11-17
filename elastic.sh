# Elastic stack installation

# 1. Install dependencies:
# ------------------------
sudo apt-get install -y curl
if [ ! -f /etc/apt/trusted.gpg.d/elastic-archive-keyring.gpg ]; then
  curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/elastic-archive-keyring.gpg
fi

# Ensure repository is only added once
REPO_ENTRY="deb https://artifacts.elastic.co/packages/8.x/apt stable main"
if ! grep -q "^${REPO_ENTRY}$" /etc/apt/sources.list.d/elastic-8.x.list 2>/dev/null; then
    echo "${REPO_ENTRY}" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list
fi

sudo apt-get update
sudo apt-get install -y elasticsearch

# 2. Convert to single-node setup:
# --------------------------------
if ! grep -q "^discovery.type: single-node$" /etc/elasticsearch/elasticsearch.yml; then
  echo "discovery.type: single-node" | sudo tee -a /etc/elasticsearch/elasticsearch.yml
fi

# 3. Install Kibana:
# ------------------
sudo apt-get install -y kibana

# Generate encryption keys only if they haven't been generated
if ! grep -q "xpack.encryptedSavedObjects.encryptionKey" /etc/kibana/kibana.yml; then
    sudo /usr/share/kibana/bin/kibana-encryption-keys generate -q | sudo tee -a /etc/kibana/kibana.yml
fi

# Set server.host only if not already set
if ! grep -q "^server.host: \"kali-purple.kali.purple\"$" /etc/kibana/kibana.yml; then
    echo "server.host: \"kali-purple.kali.purple\"" | sudo tee -a /etc/kibana/kibana.yml
fi

sudo systemctl enable elasticsearch kibana --now

# 4. Enroll Kibana:
# -----------------
# This step might need manual intervention

# 5. Enable HTTPS for Kibana:
# ---------------------------
# Check if SSL certificates need to be generated
if [ ! -f /usr/share/elasticsearch/kibana-server.p12 ]; then
    /usr/share/elasticsearch/bin/elasticsearch-certutil ca
    /usr/share/elasticsearch/bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12 --dns kali-purple.kali.purple,elastic.kali.purple,kali-purple --out kibana-server.p12

    sudo openssl pkcs12 -in /usr/share/elasticsearch/kibana-server.p12 -out /etc/kibana/kibana-server.crt -clcerts -nokeys
    sudo openssl pkcs12 -in /usr/share/elasticsearch/kibana-server.p12 -out /etc/kibana/kibana-server.key -nocerts -nodes

    sudo chown root:kibana /etc/kibana/kibana-server.*
    sudo chmod 660 /etc/kibana/kibana-server.*
fi

# Configure SSL in Kibana config only if not already set
if ! grep -q "^server.ssl.enabled: true$" /etc/kibana/kibana.yml; then
    echo "server.ssl.enabled: true" | sudo tee -a /etc/kibana/kibana.yml
    echo "server.ssl.certificate: /etc/kibana/kibana-server.crt" | sudo tee -a /etc/kibana/kibana.yml
    echo "server.ssl.key: /etc/kibana/kibana-server.key" | sudo tee -a /etc/kibana/kibana.yml
    echo "server.publicBaseUrl: \"https://kali-purple.kali.purple:5601\"" | sudo tee -a /etc/kibana/kibana.yml
fi
