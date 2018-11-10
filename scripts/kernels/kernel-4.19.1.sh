#!/usr/bin/env bash

set -e

###############################################################################
# Ubuntu Mainline Kernel
###############################################################################
# URL: http://kernel.ubuntu.com/~kernel-ppa/mainline/
###############################################################################

VERSION="4.19.1"
NAME="Kernel ($VERSION)"
MARKER="kernel-$VERSION"

###############################################################################

BASE_URL="http://kernel.ubuntu.com/~kernel-ppa/mainline/v$VERSION/"
HEADERS_ALL="linux-headers-4.19.1-041901_4.19.1-041901.201811041431_all.deb"
HEADERS_AMD64="linux-headers-4.19.1-041901-generic_4.19.1-041901.201811041431_amd64.deb"
IMAGE_AMD64="linux-image-unsigned-4.19.1-041901-generic_4.19.1-041901.201811041431_amd64.deb"
MODULES_AMD64="linux-modules-4.19.1-041901-generic_4.19.1-041901.201811041431_amd64.deb"

###############################################################################

print_install_start $NAME $VERSION

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    mkdir -p /tmp/kernel-update \
    && curl -L "$BASE_URL$HEADERS_ALL" -o /tmp/kernel-update/$HEADERS_ALL \
    && curl -L "$BASE_URL$HEADERS_AMD64" -o /tmp/kernel-update/$HEADERS_AMD64 \
    && curl -L "$BASE_URL$IMAGE_AMD64" -o /tmp/kernel-update/$IMAGE_AMD64 \
    && curl -L "$BASE_URL$MODULES_AMD64" -o /tmp/kernel-update/$MODULES_AMD64 \
    && sudo dpkg -i /tmp/kernel-update/*.deb \
    && rm -rf /tmp/kernel-update \
    && write_marker $NAME $VERSION $MARKER
else
    echo "$NAME is already installed"
fi
