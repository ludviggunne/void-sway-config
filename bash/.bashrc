# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Disable warnings since nix-shell usually takes some time
export DIRENV_WARN_TIMEOUT='-1s'
eval "$(direnv hook bash)"

alias ls='ls --color=auto -l'
alias xq='xbps-query -s'
alias xqr='xbps-query -Rs'
alias xi='xbps-install -S'
alias xr='xbps-remove -R'
alias svs='sudo sv status /var/service/*'

. git-prompt.sh
PS1='[\u@\h \W$(__git_ps1)] \$ '

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

# Just copied from 'direnv hook bash'
pwd_save_hook() {
  local previous_exit_status=$?;
  trap -- '' SIGINT;
  pwd > $TERM_PWD_CACHE_DIR/${PPID}
  trap - SIGINT;
  return $previous_exit_status;
};
if [[ ";${PROMPT_COMMAND[*]:-};" != *";pwd_save_hook;"* ]]; then
  if [[ "$(declare -p PROMPT_COMMAND 2>&1)" == "declare -a"* ]]; then
    PROMPT_COMMAND=(pwd_save_hook "${PROMPT_COMMAND[@]}")
  else
    PROMPT_COMMAND="pwd_save_hook${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
  fi
fi
