# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(direnv hook bash)"

alias ls='ls --color=auto -l'
PS1='[\u@\h \W]\$ '

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
