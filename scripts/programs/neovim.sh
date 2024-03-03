#!/bin/bash

fullName=Neovim
binName=nvim

which $binName &> /dev/null
if [ $? -ne 0 ]; then

	echo "[~] Installing $fullName"

	# Grab deps
	sudo apt install -y ninja-build gettext cmake unzip curl

	# mkdir tmp 
	mkdir temp && cd temp
	
	# Install steps
	git clone https://github.com/neovim/neovim
	cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install

	# Remove tmp
	cd ../../ && rm -rf temp
	nvim --version
else
  echo "[!] Already installed: $fullName"
fi
