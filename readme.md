# Installing new machine

## Xcode
    xcode-select --install
    sudo xcodebuild -license

## Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew install git nvm node bash-completion postgresql macvim ssh-copy-id python go tig awscli kubernetes-cli terraform

## Nvm + npms
    nvm ls-remote --lts | tail -5
    nvm install v8.12.0
    nvm use v8.12.0
    nvm alias default v8.12.0
