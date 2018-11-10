#!/usr/bin/env bash

set -e

###############################################################################
# Basic Requirements for other scripts
###############################################################################

echo "Installing some basics"
sudo apt-get update \
&& sudo apt-get upgrade -y \
&& sudo apt-get dist-upgrade -y \
&& sudo apt-get install -y --no-install-recommends \
    software-properties-common \
    wget \
    curl \
    gpg-agent \
    dirmngr \
    xz-utils \
    unzip \
&& sudo add-apt-repository main \
&& sudo add-apt-repository universe \
&& sudo add-apt-repository multiverse \
&& sudo add-apt-repository restricted

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install -y --no-install-recommends ubuntu-restricted-extras

echo "Setting up needed directories"

mkdir -p $MARKER_DIRECTORY
mkdir -p $BIN_DIRECTORY

echo "Finished installing basics"
