#!/usr/bin/env bash
brew update

for brewd_file in `ls brew.d`
do
  brewd_file_path=brew.d/$brewd_file
  cat $brewd_file_path | while read brew_action
  do
    brew $brew_action
  done
done
