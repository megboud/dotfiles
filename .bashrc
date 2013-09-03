# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias la='ls -A'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Only show a part of the prompt
# PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
# PS1="\$CurDir \$ "

##################
### MY ALIASES ###
##################

# git command autocompletion script
# source ~/bin/git-completion.bash

# navigate to C:\
alias dropbox='cd C:/Users/Hammad/Dropbox'
alias cdc='cd /cygdrive/c'
alias cdd='cd /cygdrive/c/Users/Hammad/Desktop'
alias hammad='cd C:/Users/Hammad'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias mkdir='mkdir -pv'
alias open='cygstart'

# git commamands simplified
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gpl='git pull'
alias gpu='git push'
alias gad='git add -A'
alias gmt='git mergetool'
alias bdf='git diff'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# ls alias for color-mode
alias ls='ls --color=always'

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# processes
#alias ps='ps -ax'

# refresh shell
alias reload='source ~/.bash_profile'

###############################
### ENVIRONMENTAL VARIABLES ###
###############################

# Update PATH with private bin
export PATH="${HOME}/bin:${PATH}"

# Show clean/dirty state for Git in prompt
export GIT_PS1_SHOWDIRTYSTATE=1

# Change prompt
PS1_OLD=${PS1}
export PS1='\[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\]:\[\033[1;35m\]\W\[\033[0m\] \[\033[1;92m\]$(__git_ps1 "(%s)")\[\033[0m\]$ '

# Display variable for gitk
export DISPLAY=:0.0
