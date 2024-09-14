#!/bin/bash

PACKAGE_NAME="rlwrap"
# alias gosh='rlwrap -c -q '\''"'\'' -b "'\''\"\`(){}[],#@;|" gosh -i -I "."'
alias_command="alias gosh='rlwrap -c -q '\''\"'\'' -b \"'\''\\\"\\\`(){}[],#@;|\" gosh -i -I \".\"'"

escape_for_sed() {
    echo "$1" | sed 's/[^^]/[&]/g; s/\^/\\^/g'
}

escaped_alias_command=$(escape_for_sed "$alias_command")

if [ "$1" == "uninstall" ]; then
    echo "Uninstalling $PACKAGE_NAME..."
    sudo apt-get remove --purge -y $PACKAGE_NAME
    sudo apt-get autoremove -y

    if grep -Fxq "$alias_command" ~/.bashrc; then
        sed -i "/$escaped_alias_command/d" ~/.bashrc
        echo "Alias removed from .bashrc."
    else
        echo "Alias not found in .bashrc."
    fi

    echo "$PACKAGE_NAME uninstalled successfully."

else
    echo "Installing $PACKAGE_NAME..."
    sudo apt-get install -y $PACKAGE_NAME

    echo "Adding alias to .bashrc..."

    if grep -Fxq "$alias_command" ~/.bashrc; then
        echo "The alias is already present in .bashrc. No changes made."
    else
        echo "$alias_command" >> ~/.bashrc
        echo "Alias added to .bashrc."
    fi
fi
