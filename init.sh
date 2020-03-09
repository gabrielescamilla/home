#!/bin/bash
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

git pull || { echo 'Failed to pull, stopping here' && exit 1 ; }
git submodule update --init --recursive

# TODO check home dir
cd

# Store user and elevate to install packages
sudo -s <<EOF
	if [ $(uname | grep -c "Darwin") -eq 1 ];
	then
	  ~/.home/install/install_osx.sh
	fi

	if [ $(uname | grep -c "Linux") -eq 1 ];
	then
	  chmod +x ~/.home/install/install_linux.sh
	  ~/.home/install/install_linux.sh
	fi
EOF

if [ $($SHELL --version | grep -c "zsh") -eq 0 ];
then
  echo '㋡ Defaulting to zsh'
  chsh -s $(which zsh);
fi

# run the other stuff as a normal user
# ~/.home/install/configure_linux.sh

echo '㋡ Init finished'
