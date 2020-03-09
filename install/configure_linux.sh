#!/bin/zsh
uname -o | grep -q 'GNU/Linux' || { echo 'Ommiting GNU/Linux' && exit 0 ; }
echo '㋡ configuring for GNU/Linux as $(whoami)'
id -u
