#!/bin/bash

fullName="Tmux Package Manager"
#binName=nvim


if [ -d ~/.tmux/plugins/tpm ]; then
  echo "[!] Already installed: $fullName"
else
	echo "[~] Installing $fullName"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux kill-server
fi
