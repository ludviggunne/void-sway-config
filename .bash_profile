# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

export XDG_RUNTIME_DIR=/run/user/$(id -u)
export PATH="$HOME/.scripts:$HOME/.local/bin:$PATH"

if [ "$(tty)" == "/dev/tty1" ]; then
	exec dbus-run-session sway
fi
