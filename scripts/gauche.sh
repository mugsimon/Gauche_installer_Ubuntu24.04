#!/bin/bash

PACKAGE_NAME="gauche"
VERSION="0.9.10-3build1"
ARCHITECTURE="amd64"
PACKAGE_URL="http://kr.archive.ubuntu.com/ubuntu/pool/universe/g/gauche/${PACKAGE_NAME}_${VERSION}_${ARCHITECTURE}.deb"

if [ "$1" == "uninstall" ]; then
    echo "Uninstalling $PACKAGE_NAME..."
    sudo apt-get remove --purge -y $PACKAGE_NAME
    sudo apt-get autoremove -y
    echo "$PACKAGE_NAME uninstalled successfully."
else
    TEMP_DIR=$(mktemp -d)
    cd $TEMP_DIR

    echo "Downloading $PACKAGE_NAME from $PACKAGE_URL..."
    wget $PACKAGE_URL

    echo "Installing $PACKAGE_NAME..."
    sudo dpkg -i "${PACKAGE_NAME}_${VERSION}_${ARCHITECTURE}.deb"

    echo "Fixing missing dependencies..."
    sudo apt-get install -f

    echo "Cleaning up..."
    rm -rf $TEMP_DIR

    echo "$PACKAGE_NAME installation completed successfully."
fi
