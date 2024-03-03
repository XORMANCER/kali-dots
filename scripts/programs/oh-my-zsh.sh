#!/bin/bash

fullName=Oh-My-Zsh
#binName=nvim


if [ -d ~/.oh-my-zsh ]; then
  echo "[!] Already installed: $fullName"
else
	echo "[~] Installing $fullName"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
