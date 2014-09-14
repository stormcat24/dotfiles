#!/usr/bin/env zsh
# requires ghq

# tmux
mkdir -p ~/.tmux/plugins
ghq get git@github.com:tmux-plugins/tpm.git
ghq get git@github.com:tmux-plugins/tmux-sidebar.git
ghq get git@github.com:tmux-plugins/tmux-copycat.git
ghq get git@github.com:tmux-plugins/tmux-open.git
ghq get git@github.com:tmux-plugins/tmux-resurrect.git
ghq get git@github.com:tmux-plugins/tmux-yank.git
ghq get git@github.com:tmux-plugins/tmux-online-status.git

for plugin in `ls ~/.ghq/github.com/tmux-plugins`
do
    ln -s ~/.ghq/github.com/tmux-plugins/$plugin ~/.tmux/plugins/
done
