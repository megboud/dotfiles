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

export CLICOLOR=1
export GREP_OPTIONS="--color"
export HISTSIZE=10000 # Store 10k history entries

# Git prompt components
function minutes_since_last_commit {
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

PS1="$C_RED\h$C_DARKGRAY: $C_BLUE\w\$(grb_git_prompt) \n$C_DEFAULT\$ "

source ~/.git-prompt.sh

alias ':q'="echo You are not in Vim, old sport."
alias be="bundle exec"

# Git aliases
alias gb="git branch"
alias gst="git status"
alias gss="git status --short"
alias gap="git add -p"
alias gaa="git add --all"
alias gdc="git diff --cached"
alias gdi="git diff"
alias gco="git checkout"
alias gcom="git checkout master"
alias gci="git commit -v"
alias glog='git log --date-order --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias gl='glog --graph'
alias gla='gl --all'
alias gpl="git pull"
alias gpu="git push"
alias gr="git rebase"
alias grc="git rebase --continue"

alias be="bundle exec"
alias vfwd='cd ~/Code/vagrant/ && vagrant ssh -- -N -L 3000:localhost:3000'
alias vssh='cd ~/Code/vagrant/ && vagrant ssh'

if [[ $OSTYPE == darwin13 ]]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
  source ~/bin/git-completion.bash
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
