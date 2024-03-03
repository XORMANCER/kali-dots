#!/bin/bash

fullName=PokemonASCII

binName=pokemon-colorscripts


which $binName &> /dev/null
if [ $? -ne 0 ]; then

	echo "[~] Installing $fullName"

	# mkdir tmp 
	mkdir temp && cd temp
	
	# Install steps
	git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
	cd pokemon-colorscripts
	sudo ./install.sh

	# Remove tmp
	cd ../../ && rm -rf temp
else
  echo "[!] Already installed: $fullName"
fi
