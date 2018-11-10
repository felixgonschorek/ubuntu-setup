#!/usr/bin/env bash

set -e

###############################################################################
# Gitkraken Git GUI Client
###############################################################################
# URL: https://www.gitkraken.com/
###############################################################################

NAME="Gitkraken"
MARKER="gitkraken"
VERSION="current"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://release.gitkraken.com/linux/gitkraken-amd64.deb -o /tmp/gitkraken.deb \
    && sudo apt -y --no-install-recommends install /tmp/gitkraken.deb \
    && rm /tmp/gitkraken.deb \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi