#!/usr/bin/env bash

set -e

# LOCATION OF THE MARKER FILES DETERMINATING WHAT IS INSTALLED
MARKER_DIRECTORY="$HOME/.idempotent"

# LOCAL BIN DIRECTORY
BIN_DIRECTORY="$HOME/bin"

# DO NOT REMOVE THIS IS REQUIRED
. ./helper.sh
. ./scripts/_basic-requirements.sh


# SETTINGS DEFAULT OVERRIDES FOR SCRIPTS
# DOCKER_COMPOSE_VERSION="1.20.1"

# ADD THE SCRIPTS YOU WANT TO RUN
# . ./scripts/chrome.sh

# CLEANUP
sudo apt-get autoremove \
&& sudo apt-get autoclean

echo "DONE!"