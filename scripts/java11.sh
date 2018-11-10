#!/usr/bin/env bash

set -e

###############################################################################
# OpenJDK 11
###############################################################################
# URL: https://jdk.java.net/11/
###############################################################################

NAME="Java 11 (Open JDK)"
MARKER="jdk11"
VERSION="11"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    wget https://download.java.net/java/GA/jdk11/28/GPL/openjdk-11+28_linux-x64_bin.tar.gz -O /tmp/openjdk-11+28_linux-x64_bin.tar.gz \
    && sudo tar xfvz /tmp/openjdk-11+28_linux-x64_bin.tar.gz --directory /usr/lib/jvm \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
 