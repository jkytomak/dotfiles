#!/usr/bin/env bash

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

# Fetch oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Getting oh-my-zsh.."
  git clone https://github.com/ohmyzsh/oh-my-zsh.git ~/.oh-my-zsh --quiet

  mkdir -p ~/.oh-my-zsh/custom/plugins
  cd ~/.oh-my-zsh/custom/plugins
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git --quiet
fi

if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  echo "Update zsh syntax highlighting.."
  cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  git pull
fi

if [ -d ~/.oh-my-zsh ]; then
  echo "Update oh-my-zsh custom.."
  cd ~/.oh-my-zsh/custom
  curl --silent --show-error -O https://raw.githubusercontent.com/jkytomak/dotfiles/master/jyri.zsh-theme
  if [ -d ~/.oh-my-zsh/custom/plugins/zsh-yarn-completions ]; then
    cd ~/.oh-my-zsh/custom/plugins/zsh-yarn-completions
    git pull
  else
    git clone https://github.com/chrisands/zsh-yarn-completions ~/.oh-my-zsh/custom/plugins/zsh-yarn-completions
  fi
fi

echo "Getting .rc files.."
cd ~
curl --silent --show-error -O https://raw.githubusercontent.com/jkytomak/dotfiles/master/.zshrc
curl --silent --show-error -O https://raw.githubusercontent.com/jkytomak/dotfiles/master/.gitconfig

echo "Done."
echo
