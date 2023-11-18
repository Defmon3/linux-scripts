

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
