#!/usr/bin/env bash

set -e

###############################################################################
# Golang Programming Language
###############################################################################
# URL: https://golang.org/
###############################################################################

NAME="Golang"
MARKER="golang"

###############################################################################

# GOLANG_VERSION
[ -z "${GOLANG_VERSION}" ] && GOLANG_VERSION="1.11.2"

###############################################################################

print_install_start "$NAME" "$GOLANG_VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    curl -L https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz -o golang.tar.gz \
    && sudo tar -C /usr/local -xzf golang.tar.gz \
    && rm golang.tar.gz \
    && write_marker "$NAME" "$GOLANG_VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
