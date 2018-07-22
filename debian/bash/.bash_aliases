alias ll='ls -l'
alias la='ls -lah'
alias lla='la'
alias lq='ls -lh'
alias llq='lq'
alias ..='cd ..'
alias cd='cd -P'

mkcd () {
  mkdir $1
  cd $1
}

vishow () {
  git show "$1" | vi -
}

alias gf='gfortran -g -fbacktrace -fimplicit-none'
alias vim='TERM=xterm-256color && vim'
alias ag='ag -u --numbers'

alias shutdown='sudo shutdown -P now'
alias reboot='sudo shutdown -r now'
alias restart='sudo shutdown -r now'
alias update='sudo apt-get update && sudo apt-get upgrade'

# git stuff
. ~/.git-completion.sh
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '


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

sshpi () {
  if [ -n "$1" ]; then
    ssh -X ${1}@ipadress -p port
  else
    echo "Usage: sshpi 'username'"
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

# install : librsvg2-bin
svgtopdf () {
  if [ -n "$1" ]; then
    name=$1
    name=${name%%svg}
    name=${name%%.}
    rsvg-convert -f pdf -o ${name}.pdf ${name}.svg
  else
    echo "Please provide svg file"
  fi
}
