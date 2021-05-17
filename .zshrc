# for zsh
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%y-%m-%dT%T "
export LANG=en_US.UTF-8

# for oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS=true
DISABLE_UPDATE_PROMPT=true
plugins=(
 zsh-syntax-highlighting
 zsh-yarn-completions
)
source $ZSH/oh-my-zsh.sh
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit && compinit

# current dir into path
export PATH=.:$PATH

# Mac
if [[ $(uname) == 'Darwin' ]]; then
  # editor
  export EDITOR=atom
  alias vi=$EDITOR

  # for homebrew
  export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
  export HOMEBREW_INSTALL_CLEANUP=true
  alias brew-all='brew update && brew upgrade && brew cleanup; brew doctor'

  # for node modules
  export PATH=$PATH:./node_modules/.bin

  # for nvm
  export NVM_DIR="$HOME/.nvm"
  . "/opt/homebrew/opt/nvm/nvm.sh"
  alias n='npm run-script'

  # for yarn
  export PATH=$PATH:$(yarn global bin)

  # for docker
  alias docker-remove-all='docker stop $(docker ps -q); docker rm $(docker ps -a -q); docker rmi -f $(docker images -q)'

  sleep-log() {
    DAYS=${1:-"0"}
    pmset -g log | egrep 'UserIsActive|FullWake|Display is turned on|powerd process|\(coreaudiod\) Released PreventUserIdleSystemSleep' | egrep -B 1 'UserIsActive|FullWake|Display is turned on|powerd process' | grep $(date -v -${DAYS}d +"%Y-%m-%d"); date +%Y-%m-%d\ %H:%M.%S\ nyt;
  }

  setjdk() {
    if [ $# -ne 0 ];then export JAVA_HOME=`/usr/libexec/java_home -v $@`;
    fi;
    java -version;
  }
fi

alias ll="ls -al"
alias ltr="ls -ltr"
