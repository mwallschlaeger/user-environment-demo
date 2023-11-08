#!/bin/bash

# involved devices hostname, used to identify which must be activated only on certain machines
DESKTOP="example-desktop-workstation"
NOTEBOOK="example-notebook"
NOTEBOOK_BUSINESS="example-notebook-business"

# define an example group of devices to allow extensions only be loaded for a certain group
FEDORA_DEVICES=("$NOTEBOOK" "$DESKTOP")
UBUNTU_DEVICES=("$NOTEBOOK_BUSINESS")

# define current path as variable
SCRIPT_FOLDER="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"

# add bin folder to path
PATH="$SCRIPT_FOLDER/../bin:$PATH"

# load envvars from encrypted files in envvars folder
for l in `sops -d $SCRIPT_FOLDER/../envvars/example-env.enc.sh` ; do eval "export $l" ; done

# load bash mwall extensions
source "$SCRIPT_FOLDER/ssh.sh"
source "$SCRIPT_FOLDER/kubernetes.sh"
source "$SCRIPT_FOLDER/git.sh"
source "$SCRIPT_FOLDER/docker.sh"

# execute or load GROUP / HOST specific extensions, this could also include /etc/issues for operating system or 
# notebook or desktop ...
if [[ ${FEDORA_DEVICES[*]} =~ "$HOSTNAME" ]]; then
    echo "Good Morning $(whoami)@$HOSTNAME, you are using Fedora today ..."
fi

if [[ ${UBUNTU_DEVICES[*]} =~ "$HOSTNAME" ]]; then
    echo "Good Morning $(whoami)@$HOSTNAME, you are using Ubuntu today ..."
fi