#!/usr/bin/env bash

set -e

###############################################################################
# Google Chrome
###############################################################################
# URL: https://www.google.com/chrome/
###############################################################################

NAME="Google Chrome"
MARKER="chrome"
VERSION="current"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1397BC53640DB551 \
    && curl -o /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && sudo apt install -y /tmp/chrome.deb \
    && rm /tmp/chrome.deb \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
