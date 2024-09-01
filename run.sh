#!/bin/bash

echo "--------------------------------------------"
echo "Gauche and its dependencies installation script"
echo "This script installs Gauche and its dependencies"
echo "using Debian packages from Ubuntu 22.04 (Jammy Jellyfish)."
echo "see https://packages.ubuntu.com/jammy/interpreters/gauche"
echo "--------------------------------------------"
echo

usage() {
    echo "Usage: $0 [install|uninstall|-h]"
    echo "  install   : Install Gauche and its dependencies (default)"
    echo "  uninstall : Uninstall Gauche and its dependencies"
    echo "  -h        : Display this help message"
    exit 1
}

MODE="install"

if [ "$1" == "uninstall" ]; then
    MODE="uninstall"
elif [ "$1" == "-h" ]; then
    usage
elif [ "$#" -gt 0 ]; then
    echo "Error: Unknown option '$1'"
    usage
fi

SCRIPT_DIR="scripts"

scripts=(
    "libgauche.sh"
    "libmbedcrypto7.sh"
    "libmbedx509.sh"
    "libmbedtls14.sh"
    "slib.sh"
    "gauche.sh"
)

echo "Add persmission..."
for script in "${scripts[@]}"; do
    chmod +x "$SCRIPT_DIR/$script"
done

if [ "$MODE" == "install" ]; then
    echo "Starting installation process..."
else
    echo "Starting uninstallation process..."
fi

for script in "${scripts[@]}"; do
    echo "Running $script..."
    bash "$SCRIPT_DIR/$script" "$MODE"

    if [ $? -ne 0 ]; then
	echo "Error: $script failed to execute. Exiting."
	exit 1
    fi
done

echo "--------------------------------------------"
if [ "$MODE" == "install" ]; then
    echo "Gauche and its dependencies have been installed from Ubuntu 22.04 (Jammy Jellyfish) packages."
else
    echo "Gauche and its dependencies have been uninstalled."
fi
echo "--------------------------------------------"
