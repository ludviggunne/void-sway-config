# .bash_profile

export TERM_PWD_CACHE_DIR=$HOME/.cache/termpwd
mkdir -p $TERM_PWD_CACHE_DIR
rm -f $TERM_PWD_CACHE_DIR/*

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Used by sway and ssh-agent. Created in /etc/rc.local.
export XDG_RUNTIME_DIR=/run/user/$(id -u)

export EDITOR=hx
export TERM=foot
export BROWSER=qutebrowser

export PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"

if [ "$(tty)" == "/dev/tty1" ]; then
	exec \
		ssh-agent \
		dbus-run-session \
		sway
fi
