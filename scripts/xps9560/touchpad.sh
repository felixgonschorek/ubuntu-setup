#!/usr/bin/env bash

set -e

###############################################################################
# Fix Touchpad XPS 9560
###############################################################################
# URL: https://wiki.archlinux.org/index.php/Dell_XPS_15_9560
###############################################################################

NAME="Touchpad (XPS 9560)"
MARKER=xps9560-touchpad
VERSION="n/a"

###############################################################################

print_install_start $NAME $VERSION

# TOUCHPAD
if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo apt-get install xserver-xorg-input-libinput \
    && sudo apt-get remove --purge xserver-xorg-input-synaptics \
    && write_marker $NAME $VERSION $MARKER
else
    echo "$NAME is already installed"
fi