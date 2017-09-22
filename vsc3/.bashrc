# .bashrc

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

module purge

# DMFT Modules
module load intel/14.0.2
module load intel-mkl/11.3
module load intel-mpi/5.1.2
module load python/2.7
module load mpi4py/1.3.1
module load numpy/1.9.1
module load scipy/0.14.0
module load hdf5/1.8.12
module load h5py/2.5.0
# module load w2dynamics/1.0.alpha1
# source /opt/sw/x86_64/generic/w2dynamics/.profile

# Matplot lib for hgrep -p
module load gobject-introspection/0.10.8
module load pycairo/1.8.8
module load pygobject/2.28.4
module load pygtk/2.24.0
module load matplotlib/1.5.1


# Gnuplot Modules
module load gcc/5.3
module load gnuplot/5.0.5


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias lq='ls -lh'
alias la='ls -lah'
alias qme='squeue -o "%.12i %.12P %.25j %.12u %.4t %.10M %.6D %R" | grep pickemSFB'
alias qreq="echo -n 'total requested nodes: ' && squeue | grep PD | grep '(Priority)\|(None)' | awk '{sum+=\$7} END{print sum}'"
alias qdev='squeue -o "%.12i %.12P %.12q %.25j %.12u %.4t %.10M %.6D %R" | grep devel_0128'
alias vim='TERM=xterm-256color && vim'
alias tmux='TERM=xterm-256color && tmux'
alias dfree='df -h | grep 70385 && beegfs-ctl --getquota --gid 70385'

# git completion
. ~/.git-completion.sh

# git promp
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '


set -o ignoreeof
