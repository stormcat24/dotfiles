#!/usr/bin/env bash
ghq get https://github.com/tmux-plugins/tpm
mkdir -p ~/.tmux/plugins
ln -s ~/repos/github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# prefix + I = install plugins at .tmux.conf
