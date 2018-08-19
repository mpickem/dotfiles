# list commands
alias lq='ls -lh'
alias la='ls -lha'
alias l='ls -l'
alias ll='ls -la@e'

# follow symbolic links
alias cd='cd -P'
# no accidental deletings
alias rm='rm -i'

alias shutdown='sudo shutdown -h now'
alias reboot='sudo shutdown -r now'
alias restart='sudo shutdown -r now'

# low effort vim
alias vilo='vim -u NONE "+set nocompatible" "+set noswapfile"'

alias cppcompile='c++ -std=c++11 -stdlib'

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1      ;;
      *.tar.gz)   tar xzf $1      ;;
      *.bz2)      bunzip2 $1      ;;
      *.rar)      rar x $1      ;;
      *.gz)      gunzip $1      ;;
      *.tar)      tar xf $1      ;;
      *.tbz2)      tar xjf $1      ;;
      *.tgz)      tar xzf $1      ;;
      *.zip)      unzip $1      ;;
      *.Z)      uncompress $1   ;;
      *)         echo "'$1' cannot be extracted via extract()" ;;
      esac
    else
  echo "'$1' is not a valid file"
fi
}

texmk () {
  if [ -n "$1" ]; then
    name=$1
    name=${name%%tex}
    name=${name%%.}
    pdflatex ${name}.tex
    bibtex ${name}.aux
    pdflatex ${name}.tex
    pdflatex ${name}.tex
  else
    echo "Please provide tex file"
  fi
}


texcl () {
  if [ -n "$1" ]; then
    name=$1
    name=${name%%tex}
    name=${name%%.}
    rm -fv ${name}.aux
    rm -fv ${name}.bbl
    rm -fv ${name}.blg
    rm -fv ${name}.log
    rm -fv ${name}.out
    rm -fv ${name}.toc
  else
    echo "Please provide tex file"
  fi
}

# git stuff
. ~/.git-completion.sh
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)") '

export CLICOLOR=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="/usr/local/bin:$PATH"
# added by Anaconda3 5.2.0 installer
export PATH="/Users/matthias/anaconda3/bin:/Users/matthias/bin:$PATH"
