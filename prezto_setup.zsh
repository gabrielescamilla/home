#!/bin/zsh

# This line sets the variable 'filename' to the first argument passed to the script
filename=$1

# This line prints the hostname of the current system
echo "Hostname: $(hostname)"

ln -s "${HOME}/.home/prezto" "${HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${HOME}/.${rcfile:t}"
done
