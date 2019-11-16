#!/bin/zsh

git pull || { echo 'Failed to pull, stopping here' && exit 1 ; }
