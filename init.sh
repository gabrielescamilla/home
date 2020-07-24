#!/bin/bash
uname -o | grep -q 'GNU/Linux' || { echo 'Not a GNU/Linux' && exit 0 ; }
git pull || { echo 'Failed to pull, stopping here' && exit 1 ; }
git submodule update --init --recursive

echo '㋡ Init finished'
