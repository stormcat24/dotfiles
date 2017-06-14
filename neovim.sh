#!/usr/bin/env bash

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh $HOME/dein.vim

mkdir -p ~/.config
cd ~/.config && ln -s ${HOME}/.vim nvim
cd ~/.config && ln -s ${HOME}/.vimrc init.vim
