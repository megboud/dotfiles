setopt PROMPT_SUBST
source ~/.zsh_prompt

zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)

alias la='ls -a'
alias gs='git status'
alias bake='bin/rake'
alias bails='bin/rails'
