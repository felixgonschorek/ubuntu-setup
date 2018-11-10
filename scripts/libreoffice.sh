#!/usr/bin/env bash

set -e

###############################################################################
# LibreOffice Free Office Suite
###############################################################################
# URL: https://www.libreoffice.org/
###############################################################################

NAME="LibreOffice"
MARKER="libreoffice"
VERSION="ppa version"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get purge -y libreoffice* \
    && sudo add-apt-repository -y ppa:libreoffice/ppa \
    && sudo apt-get update \
    && sudo apt-get install -y libreoffice  \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi

