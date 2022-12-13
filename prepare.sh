#!/usr/bin/env bash

# install homebrew
if [ -z `which brew` ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install sdkman
if [ -z `which sdk` ]; then
  curl -s https://get.sdkman.io | bash
  source ~/.sdkman/bin/sdkman-init.sh
fi

# install bin
# https://github.com/marcosnils/bin 
BIN_VERSION=0.13.0
NEW_BIN_DIR=/opt/marcosnils-bin/v${BIN_VERSION}
if [ -d $NEW_BIN_DIR ]; then
  echo "Skip install marcosnils/bin."
else
  mkdir -p $NEW_BIN_DIR
  curl -L "https://github.com/marcosnils/bin/releases/download/v${BIN_VERSION}/bin_${BIN_VERSION}_Darwin_arm64" -o $NEW_BIN_DIR/bin
  chmod +x $NEW_BIN_DIR/bin
  sudo ln -s $NEW_BIN_DIR/bin /usr/local/bin/bin
fi
