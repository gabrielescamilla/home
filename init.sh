#!/bin/bash
git pull || { echo 'Failed to pull, stopping here' && exit 1; }
git submodule update --init --recursive

cd

if [ $(uname -a | grep -c "Ubuntu") -eq 1 ];
then
  . ~/.home/os/ubuntu_setup.sh
fi

# dot files links
ln -s ~/.home/vim/vimrc ~/.vimrc
