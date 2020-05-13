#!/bin/bash
git pull || { echo 'Failed to pull, stopping here' && exit 1; }
git submodule update --init --recursive

cd


# dot files links
ln -s ~/.home/dotfiles/vimrc ~/.vimrc
ln -s ~/.home/dotfiles/fzf.bash ~/.fzf.bash
ln -s ~/.home/dotfiles/fzf.zsh ~/.fzf.zsh
ln -s ~/.home/dotfiles/gitconfig ~/.gitconfig
ln -s ~/.home/dotfiles/zshrc ~/.zshrc

# Setup
if [ $(uname -a | grep -c "Ubuntu") -eq 1 ];
then
  . ~/.home/os/ubuntu_setup.sh
fi
