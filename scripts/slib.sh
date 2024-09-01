#!/bin/bash

PACKAGE_NAME="slib"
VERSION="3b6-3build1"
ARCHITECTURE="all"
PACKAGE_URL="http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/slib/${PACKAGE_NAME}_${VERSION}_${ARCHITECTURE}.deb"

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
