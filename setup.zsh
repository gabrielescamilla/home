#!/bin/zsh

# This line sets the variable 'filename' to the first argument passed to the script
filename=$1

# Ripgrep and completion
brew install ripgrep
brew install fzf
ln -s ${HOME}/.home/fzf.zsh ${HOME}/.fzf.zsh

# Intall neovim
brew install 
ln -s ${HOME}/.home/neovim/config ${HOME}/.config/nvim

# This line prints the hostname of the current system
echo "Hostname: $(hostname)"

ln -s "${HOME}/.home/prezto" "${HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${HOME}/.${rcfile:t}"
done
