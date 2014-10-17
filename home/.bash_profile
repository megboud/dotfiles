##################### Colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"


##################### Add Git info to prompt
source ~/.git-prompt.sh
source ~/.git-completion.bash

minutes_since_last_commit() {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

grb_git_prompt() {
    local g="$(__gitdir)"
    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=${YELLOW}
        else
            local COLOR=${GREEN}
        fi
        local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"
        # The __git_ps1 function inserts the current git branch where %s is
        local GIT_PROMPT=`__git_ps1 "(%s|${SINCE_LAST_COMMIT})"`
        echo ${GIT_PROMPT}
    fi
}
PS1="$C_RED\h: $C_BLUE\w\$(grb_git_prompt) \n$C_DEFAULT\$ "

if [ $OSTYPE == darwin13 ]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
elif [ $OSTYPE == 'linux-gnu' ]; then
  export PATH=$HOME/npm/bin:$PATH
fi

##################### Aliases and helper functions

alias vfwd='cd ~/vagrant/ && vagrant ssh -- -N -L 3000:localhost:3000'
alias vssh='cd ~/vagrant/ && vagrant ssh'
alias ctagshere='ctags -R --exclude=.git --exclude=log --exclude=node_modules *'

alias be='bundle exec'
alias berc='bundle exec rails c'
alias bers='bundle exec rails s'
alias bert='bundle exec rake test:all'
alias beri='bundle exec ruby -Itest'
alias ss='script/server'
alias st='script/test'

alias ll='ls -alF'
alias la='ls -ACF'
alias l='ls -CF'
alias g='grep'

if [ $OSTYPE == darwin13 ]; then
  update_vagrant() {
    cd ~/src/vagrant/ \
      && git pull origin master \
      && vagrant bundle \
      && vagrant up \
      && vagrant provision
  }
fi

kill_unicorns() {
  kill -9 $(ps aux | grep unicorn | awk "{print $2}")
}

##################### Tmux Options

source ~/.tmuxinator/tmuxinator.bash

##################### Export options

export CLICOLOR=1
export GREP_OPTIONS='--color=always -rnI'
export HISTSIZE=10000 # Store 10k history entries
export HISTTIMEFORMAT="%d/%m/%y %T "
export EDITOR='vim'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
