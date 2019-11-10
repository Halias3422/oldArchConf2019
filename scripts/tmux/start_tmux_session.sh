#!/bin/bash

session="Halias"

tmux has-session -t $session 2>/dev/null

if [ $? != 0 ]; then
	tmux new -s Halias
else
	tmux attach-session -t $session
fi
