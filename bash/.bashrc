# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(direnv hook bash)"

alias ls='ls --color=auto -l'
alias xq='xbps-query -s'
alias xqr='xbps-query -Rs'
alias xi='xbps-install -S'
alias xr='xbps-remove -R'
alias svs='sudo sv status /var/service/*'

PS1='[\u@\h \W] \$ '

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

export HISTFILESIZE=20000
export HISTSIZE=10000
HISTCONTROL=ignoredups

shopt -s histappend
shopt -s cmdhist
shopt -s extglob
shopt -s dotglob
shopt -s cdspell
shopt -s checkwinsize
