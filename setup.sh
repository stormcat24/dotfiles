#!/bin/bash

DOT_FILES_DIR=dotfiles

cd ~/

if [ ! -e $DOT_FILES_DIR ]; then
  echo "not exists $DOT_FILES_DIR."
  exit 1
fi

for ENTRY in `ls -a $DOT_FILES_DIR`
do
  ENTRY_PATH=$DOT_FILES_DIR/$ENTRY
  if [ -f $ENTRY_PATH ]; then
    if [[ "$ENTRY" =~ ^\..+$ ]]; then
      if [ -f $ENTRY ]; then
        echo "$ENTRY already exists."
      else
        ln -s $ENTRY_PATH
        echo "linked $ENTRY_PATH"
        # TODO bash系だけ読み込む
        if [[ "$ENTRY" =~ ^\.bash_.*$ ]]; then
          source $ENTRY_PATH
        fi
      fi
    fi
  fi
done
