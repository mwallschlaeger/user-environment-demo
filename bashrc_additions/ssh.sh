#!/bin/bash

# load ssh keys 
sops exec-file --no-fifo $SCRIPT_FOLDER/../keys/example.enc 'ssh-add {}' &> /dev/null

# add link to my git ssh config into ~/.ssh/config
# https://superuser.com/questions/1357394/non-default-location-for-ssh-config-file-in-linux
config_location="/home/$(whoami)/.ssh/config"
# String to add at the beginning of the ssh_config file
ssh_config_include_string="Include $SCRIPT_FOLDER/../confs/ssh_config"
# temporary ssh_config location
tmp_location="/tmp/ssh_config"

# Get the first line of the file
first_line=$(head -n 1 "$config_location")

# add include line at beginning of ssh_config
if [ "$first_line" != "$ssh_config_include_string" ]; then
    # Add the line if they are not equal
    { echo "$ssh_config_include_string"; cat "$config_location"; } > "$tmp_location"
    mv "$tmp_location" "$config_location"
fi