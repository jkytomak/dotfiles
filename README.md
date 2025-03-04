# Installing new machine

## Xcode

Install Xcode from the Mac App Store.

    sudo xcodebuild -license

## Homebrew

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew install git tig

### Keep uptodate by adding to profile

    brew outdated

## Terminal Settings

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jkytomak/dotfiles/master/terminal-setup.sh)"

## Nvm + npms

    brew install nvm node yarn
    nvm ls-remote --lts | tail -5
    nvm install --lts
    nvm use --lts
    nvm alias default "lts/*"

## Postgresql

    brew install bash-completion postgresql
    brew tap homebrew/services
    brew services start postgresql

## Firefox

    about:config
    browser.urlbar.openintab: true
    browser.search.openintab: true
    browser.tabs.loadBookmarksInTabs: true
    browser.link.open_newwindow.restriction: 0
    browser.gesture.swipe.left: ''
    browser.gesture.swipe.right: ''
