alias lq='ls -lh'
alias la='ls -la'
alias l='ls -l'

# git stuff
. ~/.git-completion.sh
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)") '

export CLICOLOR=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="/usr/local/bin:$PATH"
# added by Anaconda3 5.2.0 installer
export PATH="/Users/matthias/anaconda3/bin:$PATH"
