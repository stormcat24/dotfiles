#!/usr/bin/env bash -e
# OSX only

# show hidden files and directories 
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
