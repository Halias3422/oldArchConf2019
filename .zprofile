emulate sh -c 'source /etc/profile'

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

export LANG=en_IN.UTF-8
export LANGUAGE=en_IN.UTF-8
