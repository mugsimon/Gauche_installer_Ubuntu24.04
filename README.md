# Gauche and Dependencies Installer for Ubuntu 24.04

This script installs or uninstalls Gauche and its dependencies using Debian packages from Ubuntu 22.04 (Jammy Jellyfish). And also install rlwrap and add alias to `.bashrc`.

## Overview

The `run.sh` script manages the installation and uninstallation of Gauche and its related libraries. It handles the following packages:
- Gauche
- libgauche
- libmbedcrypto7
- libmbedx509
- libmbedtls14
- slib

## Requirements
- Ubuntu or Debian-based system.
- Git for handling submodules.

## Usage
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/mugsimon/Gauche_installer_Ubuntu24.04.git
   ```
2. **Run the Script**:
   ```bash
   cd Gauche_installer_Ubuntu24.04
   chmod +x run.sh
   ./run.sh [install|uninstall|-h]
   ```
3. **Run Gauche**
   ```bash
   gosh
   ```
