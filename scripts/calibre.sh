#!/usr/bin/env bash

set -e

###############################################################################
# Calibre Ebook Management
###############################################################################
# URL: https://calibre-ebook.com
###############################################################################

NAME="Calibre Ebook Management"
MARKER="calibre"
VERSION="current"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://download.calibre-ebook.com/linux-installer.sh -o /tmp/calibre.sh \
    && sh /tmp/calibre.sh \
    && rm /tmp/calibre.sh \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
