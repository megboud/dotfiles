if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
# shopt -s histappend # Append to the history file when exiting instead of overwriting it

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


# PS1="\h:\W\$(grb_git_prompt) \u\$ "

# export PS1="\n$C_DARKGRAY[$C_RED\$(rbenv version-name)$C_DARKGRAY] $C_BLUE\h $C_DARKGRAY: $C_DARKGRAY\w\n$C_DARKGRAY\$$C_DEFAULT "
PS1="$C_RED\h$C_DARKGRAY: $C_BLUE\w\$(grb_git_prompt) \n$C_DEFAULT\$ "

source ~/bin/git-completion.bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi

if [[ $OSTYPE == darwin13 ]]; then
  alias vim='mvim -v'
fi

alias ':q'="echo You are not in Vim, old sport."
