#!/usr/bin/env bash -e

GHQ_HOME=$HOME/repos
DOT_FILES_DIR=$GHQ_HOME/github.com/stormcat24/dotfiles

if [ ! -e $DOT_FILES_DIR ]; then
  echo "not exists $DOT_FILES_DIR."
  exit 1
fi

# link dotfiles
for ENTRY in `ls -a $DOT_FILES_DIR`
do
  ENTRY_PATH=$DOT_FILES_DIR/$ENTRY
  if [ -f $ENTRY_PATH ]; then
    if [[ $ENTRY =~ "^\..+$" ]]; then
      if [ -f $HOME/$ENTRY ]; then
        echo "$ENTRY already exists."
      else
        ln -s $ENTRY_PATH $HOME/
        echo "linked $ENTRY_PATH"
      fi
    fi
  fi
done


if [ ! -d "~/.config" ]; then
  mkdir -p ~/.config
fi

# link .config/dir
for CENTRY in `ls $DOT_FILES_DIR/.config`
do
  if [ -L ~/.config/$CENTRY ]; then
    rm ~/.config/$CENTRY 
  fi
  ln -s `pwd`/.config/$CENTRY ~/.config/
done

# reload .zshrc
source ~/.zshrc
echo "reloaded ~/.zshrc"
