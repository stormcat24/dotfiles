#!/usr/bin/env bash
set -e
# OSX only

# show hidden files and directories 
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# set fastest key repeat rate
# Note: Changes take effect immediately for new apps, existing apps may need restart
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
