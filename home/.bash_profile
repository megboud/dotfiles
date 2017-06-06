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
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"

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
