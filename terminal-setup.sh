#!/bin/bash

echo
echo "Updating terminal settings"
echo

# Check we have Git
command -v git > /dev/null

if [[ $? != 0 ]]; then
  echo "Install git first!"
  exit
fi

# Check we have Curl
command -v curl > /dev/null

if [[ $? != 0 ]]; then
  echo "Install curl first!"
  exit
fi

echo "Getting .rc files.."

cd ~
curl --silent -O https://raw.githubusercontent.com/jkytomak/dotfiles/master/.bash_profile
curl --silent -O https://raw.githubusercontent.com/jkytomak/dotfiles/master/.vimrc
curl --silent -O https://raw.githubusercontent.com/jkytomak/dotfiles/master/.gitignore
curl --silent -O https://raw.githubusercontent.com/jkytomak/dotfiles/master/.gitconfig

echo "Done."
echo
