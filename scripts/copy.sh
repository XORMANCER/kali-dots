#!/bin/bash

# Up from scripts dir
cd ..

# Copy dotfiles, set USER perms
sudo cp -r .config ${HOME}
sudo chown -R $USER ~/.config

# Set perms for BSPWM
sudo chmod u+x ~/.config/bspwm/bspwmrc

# Transfer fonts, update cache
sudo cp -r -u .fonts ${HOME}
sudo fc-cache

# cp -r -u .themes ${HOME}
# Copy themes systemwide
sudo cp -r -u .themes/* /usr/share/themes/

# Copy themes systemwide
sudo cp -r -u .icons/* /usr/share/icons/

# Setup greeter for GTK theme and background
if [ ! -d /usr/share/desktop-base/custom ]; then
  sudo mkdir /usr/share/desktop-base/custom
fi

sudo cp .greeter/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
sudo cp .greeter/lock.png /usr/share/desktop-base/custom/lock.png
sudo cp .greeter/background.png /usr/share/desktop-base/custom/background.png
sudo cp .greeter/mug.png /usr/share/desktop-base/custom/mug.png

# Copy root dotfiles
sudo cp .gtkrc-2.0 ${HOME}
sudo cp .tmux.conf ${HOME}
