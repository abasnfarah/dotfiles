#!/bin/bash

source ./framework.sh

cat << EOF
Preparing to install Arch packages

Choosing yes will install all of the following Arch packages
EOF

display_packages

cat << EOF

If you don't want to install all of the following packages you can 
edit the install script to omit or add additional packages.

EOF

while true; do
    read -rp "Do you want to install the listed packages? (y/n) " yn 
    case "${yn}" in
        [Yy]*)
            install_packages 
            break;;
        [Nn]*) exit 0;;
        *) echo "Invalid Input. Please respond with y (yes) or n (no)";;
    esac
done
