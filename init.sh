#!/bin/zsh
git pull || { echo 'Failed to pull, stopping here' && exit 1 ; }
git submodule update --init --recursive

# TODO check home dir
cd

if [ $(uname | grep -c "Darwin") -eq 1 ];
then
  source ~/.home/install_osx.sh
fi

# Map zsh
for file in .zshrc .zpreztorc; do
	if [[ ! -a "$HOME/$file" && ! -h "$HOME/$file" ]]; then
		ln -s ~/.home/zsh/$file ~/$file
	fi
done

#souce zsh
source ~/.zshrc

# map other dotfiles
for file in .tmux.conf .tmux .gitconfig .vim .vimrc .iterm-settings .ignore; do
	if [[ ! -a "$HOME/$file" && ! -h "$HOME/$file" ]]; then
		ln -s ~/.home/$file ~/$file
	fi
done

# Load vim plugins
echo '㋡ Loading vim plugins'
vim -E -c BundleInstall -c qall || { echo 'Failed loading vim plugins' ; }

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.home/zsh/prezto/runcoms/^README.md(.N); do
	if [ ! -s "${ZDOTDIR:-$HOME}/.${rcfile:t}" ]; then
		ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	fi
done

type rg &>/dev/null || { echo 'rg not installed!' ; }
type fd &>/dev/null || { echo 'fd not installed!' ; }
type fzf &>/dev/null || { echo 'fzf not installed!' ; }
type tmux &>/dev/null || { echo 'tmux not installed!' ; }

echo '㋡ Init finished'
