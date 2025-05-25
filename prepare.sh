#!/usr/bin/env bash

# install homebrew
if [ -z `which brew` ]; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install sdkman
if [ -z `which sdk` ]; then
  curl -s https://get.sdkman.io | bash
  source ~/.sdkman/bin/sdkman-init.sh
fi