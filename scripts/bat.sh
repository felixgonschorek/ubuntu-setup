#!/usr/bin/env bash

set -e

###############################################################################
# Bat - Cat with wings
###############################################################################
# URL: https://github.com/sharkdp/bat
###############################################################################

NAME="Bat - Cat with wings"
MARKER="bat"
VERSION="0.8.0"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://github.com/sharkdp/bat/releases/download/v${VERSION}/bat_${VERSION}_amd64.deb -o /tmp/bat.deb \
    && sudo dpkg -i /tmp/bat.deb \
    && sudo apt-get install -f -y --no-install-recommends \
    && rm /tmp/bat.deb \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
