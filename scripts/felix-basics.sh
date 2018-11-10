#!/usr/bin/env bash

set -e

###############################################################################
# Basic Requirements for Felix 
###############################################################################

echo "Installing some basics for felix"
sudo apt-get update \
&& sudo apt-get upgrade -y \
&& sudo apt-get dist-upgrade -y \
&& sudo apt-get install -y --no-install-recommends \
  ncdu \
  rsync \
  makepasswd \
  unzip \
  screen \
  uuid \
  vim \
  mc \
  shutter

curl -o $HOME/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy \
  && chmod 700 $HOME/bin/diff-so-fancy 

echo "Setting up needed directories"

mkdir -p $MARKER_DIRECTORY
mkdir -p $BIN_DIRECTORY

echo "Finished installing basics"
