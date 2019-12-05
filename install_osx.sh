#!/bin/zsh
echo '㋡ Installing things for OSX'

# Add vim
if [ $(command -v vim 2>/dev/null | grep -c "bin/vim") -eq 0 ];
then
  echo '㋡ Adding vim'
  brew install vim;
fi

# Add curl
if [ $(command -v curl 2>/dev/null  | grep -c "bin/curl") -eq 0 ];
then
  echo '㋡ Adding curl'
  brew install curl;
fi

# Add ripgrep
if [ $(command -v rg 2>/dev/null  | grep -c "bin/rg") -eq 0 ];
then
  echo '㋡ Adding ripgrep'
  brew install ripgrep;
fi

# Add fd-find
if [ $(command -v fd  2>/dev/null  | grep -c "bin/fd") -eq 0 ];
then
  echo '㋡ Adding fd-find'
  brew install fd;
fi

# Add zshell
if [ $(command -v zsh  2>/dev/null  | grep -c "bin/zsh") -eq 0 ];
then
  echo '㋡ Adding zsh'
  brew install zsh;
fi
if [ $($SHELL --version | grep -c "zsh") -eq 0 ];
then
  echo '㋡ Defaulting to zsh'
  chsh -s $(which zsh);
fi

# Add fzf
if [ $(command -v fzf  2>/dev/null | grep -c "bin/fzf") -eq 0 ];
then
  echo '㋡ Adding fzf'
  brew install fzf;
fi

# Add tmux
if [ $(command -v tmux  2>/dev/null | grep -c "bin/tmux") -eq 0 ];
then
  echo '㋡ Adding tmux'
  brew install tmux;
fi
