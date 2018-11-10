#!/usr/bin/env bash

set -e

###############################################################################
# Android Studio
###############################################################################
# URL: https://developer.android.com/studio/index.html#downloads
###############################################################################

NAME="Android Studio"
MARKER="android-studio"
VERSION="3.2.1.0"

###############################################################################

# ANDROID_STUDIO_URL
[ -z "${ANDROID_STUDIO_URL}" ] && ANDROID_STUDIO_URL="https://dl.google.com/dl/android/studio/ide-zips/3.2.1.0/android-studio-ide-181.5056338-linux.zip"

###############################################################################

print_install_start "$NAME" "$VERSION"

if [ ! -f $MARKER_DIRECTORY/$MARKER ]; then
    sudo dpkg --add-architecture i386 \
    && sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends \
        libc6:i386 \
        libncurses5:i386 \
        libstdc++6:i386 \
        lib32z1 \
        libbz2-1.0:i386 \
        android-tools-adb \
    && curl -L --http1.1 $ANDROID_STUDIO_URL -o /tmp/as.zip \
    && sudo unzip /tmp/as.zip -d /opt \
    && ln -s /opt/android-studio/bin/studio.sh $BIN_DIRECTORY/studio \
    && write_marker "$NAME" "$VERSION" "$MARKER"
else
    echo "$NAME is already installed"
fi
