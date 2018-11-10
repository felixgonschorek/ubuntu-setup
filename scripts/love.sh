#!/usr/bin/env bash

set -e

###############################################################################
# Löve Game Engine
###############################################################################
# URL: https://love2d.org/
###############################################################################

NAME="Löve"
MARKER="löve"
VERSION="ppa version"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo add-apt-repository -y ppa:bartbes/love-stable \
    && sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
        love \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
