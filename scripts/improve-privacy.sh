#!/usr/bin/env bash

set -e

###############################################################################
# Improving Ubuntu Privacy
###############################################################################
# URL: https://github.com/butteff/Ubuntu-Telemetry-Free-Privacy-Secure/blob/master/ubuntu_secure.sh
###############################################################################

NAME="Improve Privacy"
MARKER="improve-privacy"
VERSION="n/a"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get -y purge \
        unity-lens-shopping \
        unity-webapps-common \
        apturl \
        zeitgeist \
        zeitgeist-datahub \
        zeitgeist-core \
        zeitgeist-extension-fts \
        unity8* \
    && sudo apt-get -y autoremove \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi