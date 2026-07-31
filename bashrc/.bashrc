#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

set -o vi

export EDITOR=vim
export VISUAL=vim

HISTSIZE=-1
HISTFILESIZE=-1

alias vi='NVIM_APPNAME=lazyvim nvim'
fastfetch