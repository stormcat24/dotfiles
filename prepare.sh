#!/usr/bin/env bash

# install homebrew
if [ -z `which brew` ]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

curl -sSO https://raw.githubusercontent.com/stormcat24/dotfiles/master/Brewfile
if [  $? -ne 0 -a -e ./Brewfile ]; then
    echo "Failed to download Brewfile." 1>&2
    exit 1
fi

# gobrew
if [ -z `which gobrew` ]; then
    curl -L https://raw.github.com/grobins2/gobrew/master/tools/install.sh | sh
    wget --no-check-certificate https://raw.github.com/grobins2/gobrew/master/tools/install.sh -O - | sh
fi


brew bundle Brewfile
