#export GEM_HOME=/Users/meganboudreau/.gem/ruby/2.2.3

# Enable tab completion
source ~/.git-completion.bash
source ~/.profile

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1

pluralize() {
  if [ $2 -eq 1 -o $2 -eq -1 ]
  then
    echo ${1}
  else
    echo ${1}s
  fi
}

time_since_last_commit() {
  local now=`date +%s`
  local last_commit=`git log --pretty=format:'%at' -1`
  local seconds_since_last_commit=$((now - last_commit))
  local d=$((seconds_since_last_commit/60/60/24))
  local h=$((seconds_since_last_commit/60/60%24))
  local m=$((seconds_since_last_commit/60%60))

  if [[ $d > 0 ]]; then
    echo $d $(pluralize "day" $d)
  elif [[ $h > 0 ]]; then
    echo $h $(pluralize "hour" $h)
  elif [[ $m > 0 ]]; then
    echo $m $(pluralize "min" $m)
  else
    echo $seconds_since_last_commit $(pluralize "second" $seconds_since_last_commit)
  fi
}

git_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local SINCE_LAST_COMMIT="$(time_since_last_commit)${NORMAL}"
    local GIT_PROMPT=`__git_ps1 "(%s|${SINCE_LAST_COMMIT})"`
    echo ${GIT_PROMPT}
  fi
}

PS1="$purple\u: $blue\w $green\$(git_prompt) \$ $reset"

# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
# export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"

#aliases
alias la='ls -a'
alias gs='git status'
alias gc='git checkout'
alias bake='bin/rake'
if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi

if [[ $OSTYPE = darwin* ]]; then
  alias ll='ls -alFG'
  alias la='ls -ACG'
  alias ls='ls -CFG'
elif [ $OSTYPE == 'linux-gnu' ]; then
  alias ll='ls --color=auto -alF'
  alias la='ls --color=auto -ACF'
  alias ls='ls --color=auto -CF'
fi

export PRY=1
export PATH=$PATH:/Users/meganboudreau/Library/Android/sdk/platform-tools/
#export GOPATH=/Users/meganboudreau/go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export GOROOT="/usr/local/Cellar/go/1.7.3/libexec/"
#export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

#Add RVM to PATH
export PATH="$PATH:$HOME/.rvm/bin"
export GOPATH="/Users/meganboudreau/go/"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/Users/meganboudreau/Library/Android/sdk/platform-tools/
export GOROOT="/usr/local/Cellar/go/1.7.3/libexec/"
export PATH="$PATH:$GOROOT/bin"
export PATH="$HOME/.yarn/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
