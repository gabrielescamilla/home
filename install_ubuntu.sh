!/bin/bash
uname -o | grep -q 'GNU/Linux' || { echo 'Ommiting GNU/Linux' && exit 0 ; }
echo '㋡ installing for GNU/Linux'
apt update
git pull || { echo 'Failed to pull, stopping here' && exit 1 ; }
git submodule update --init --recursive

# Add vim
if [ $(dpkg-query -W -f='${Status}' vim 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo '㋡ Adding vim'
  apt install vim -y;
fi

# Add curl
if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo '㋡ Adding curl'
  apt install curl -y;
fi

# Add ripgrep
if [ $( type rg 2>/dev/null | grep -c "/bin/rg") -eq 0 ];
then
  echo '㋡ Adding ripgrep'
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
  dpkg -i ripgrep_11.0.2_amd64.deb
fi

# Add zshell
if [ $(dpkg-query -W -f='${Status}' zsh 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo '㋡ Adding zsh'
  apt install zsh -y;
fi
if [ $($SHELL --version | grep -c "ok default shell") -eq 0 ];
then
  echo '㋡ Defaulting to zsh'
  chsh -s $(which zsh);
fi


# Add fd-find
if [ $( type fd 2>/dev/null | grep -c "/bin/fd") -eq 0 ];
then
  echo '㋡ Adding fd-find'
  curl -LO https://github.com/sharkdp/fd/releases/download/v7.4.0/fd_7.4.0_amd64.deb
  dpkg -i fd_7.4.0_amd64.deb
fi

# Add tmux
if [ $(dpkg-query -W -f='${Status}' tmux 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo '㋡ Adding tmux'
  apt install tmux -y;
fi

# Add pydf
if [ $(dpkg-query -W -f='${Status}' pydf 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo '㋡ Adding pydf'
  apt install pydf -y;
fi

# Add fzf
if [ $(command -v fzf  2>/dev/null | grep -c "bin/fzf") -eq 0 ];
then
  echo '㋡ Adding fzf'
  ~/.home/fzf/install --all
fi

type vim &>/dev/null || { echo 'vim not installed!' ; }
type curl &>/dev/null || { echo 'curl not installed!' ; }
type zsh &>/dev/null || { echo 'zshell not installed!' ; }
type rg &>/dev/null || { echo 'rg not installed!' ; }
type fd &>/dev/null || { echo 'fd not installed!' ; }
type fzf &>/dev/null || { echo 'fzf not installed!' ; }
type tmux &>/dev/null || { echo 'tmux not installed!' ; }
type pydf &>/dev/null || { echo 'pydf not installed!' ; }

echo '㋡ Installation complete'
