# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

umask 077
# User specific aliases and functions
alias lt='ls -lrt'
alias rm='rm -f'
PS1='\[\e[0;31m\][\u@\h \[\e[0;34m\]\t\[\e[m\] \[\e[0;32m\]\W\[\e[m\]\[\e[0;31m\]]\$\[\e[0m\] '
