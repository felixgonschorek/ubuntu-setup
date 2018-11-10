#!/usr/bin/env bash

set -e

###############################################################################
# OpenVPN
###############################################################################
# URL: https://openvpn.net/
###############################################################################

NAME="Open VPN"
MARKER="openvpn"
VERSION="distro version"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        openvpn \
        network-manager \
        network-manager-openvpn \
        network-manager-openvpn-gnome \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi

