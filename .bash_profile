GIT_PS1_SHOWDIRTYSTATE=true
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

export PATH=".:/usr/local/sbin:$PATH:$HOME/.cabal/bin"

alias ll="ls -al"
alias ltr="ls -ltr"
alias vi="atom"

sleep-log() {
  [[ -z "$1" ]] &&  adjust="" || adjust="-v -$1d"
  pmset -g log | egrep 'UserIsActive|FullWake|Display is turned on|powerd process|\(coreaudiod\) Released PreventUserIdleSystemSleep' | egrep -B 1 'UserIsActive|FullWake|Display is turned on|powerd process' | grep `date $adjust +"%Y-%m-%d"`; date +%Y-%m-%d\ %H:%M.%S\ nyt;
}

export HISTTIMEFORMAT="%y-%m-%dT%T "
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
