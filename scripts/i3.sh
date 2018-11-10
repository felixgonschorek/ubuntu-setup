#!/usr/bin/env bash

set -e

###############################################################################
# i3 Window Manager
###############################################################################
# URL: https://i3wm.org/
###############################################################################

NAME="i3 Window Manager"
MARKER="i3wm"
VERSION="current"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb /tmp/keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a \
    && sudo dpkg -i /tmp/keyring.deb \
    && echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | sudo cut -f2 -d=) universe" | sudo tee --append /etc/apt/sources.list.d/sur5r-i3.list \
    && sudo apt-get update \
    && sudo apt-get -y --no-install-recommends install \
        i3 \
        i3status \
        i3lock \
        unity-greeter-badges \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi

