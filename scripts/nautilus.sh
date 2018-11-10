#!/usr/bin/env bash

set -e

###############################################################################
# Gnome File Manager (formerly Nautilus)
###############################################################################
# URL: https://gitlab.gnome.org/GNOME/nautilus
###############################################################################

NAME="Nautilus File Manager"
MARKER="nautilus"
VERSION="distro version"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install -y \
        nautilus \
    && gsettings set org.gnome.desktop.background show-desktop-icons false \
    && gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view' \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
