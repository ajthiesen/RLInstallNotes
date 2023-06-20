#!/bin/bash

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." >&2
    exit 1
fi

# Define the configuration file path
config_file="/etc/systemd/logind.conf"

# Check if the configuration file exists
if [ ! -f "$config_file" ]; then
    echo "Configuration file $config_file does not exist." >&2
    exit 1
fi

# Check if the configuration file is writable
if [ ! -w "$config_file" ]; then
    echo "Configuration file $config_file is not writable." >&2
    exit 1
fi

# Update the HandleLidSwitch option
sed -i 's/^#HandleLidSwitch=.*/HandleLidSwitch=ignore/' "$config_file"

echo "HandleLidSwitch option in $config_file has been set to 'ignore'."

