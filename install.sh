#!/bin/sh

if [[ -e $HOME/.vimrc || -e $HOME/.vim ]]; then
  echo "Error: ~/.vimrc or ~/.vim already exists. \n\
       It looks like you already have some vim configuration. Save them then remove those files"
else
  echo "=== Checking out vundle"
  git submodule update --init

  echo "=== Linking bash directories"
  ln -s $PWD/bash/bash_profile $HOME/.bash_profile

  echo "=== Linking vim directories"
  ln -s $PWD/vim $HOME/.vim
  ln -s $PWD/vim/vimrc $HOME/.vimrc

  echo "=== Vundling"
  vim +BundleInstall +qall

  echo "=== Done"
fi
