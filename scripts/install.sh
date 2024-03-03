#!/bin/bash

# GLOBAL COLORS
ORANGE='\033[0;33m';
GREEN='\033[0;32m';
RED='\033[0;31m'
MAGENTA='\033[0;35m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Clear screen
clear

# Ascii art banner
echo -e " 
██╗  ██╗ ██████╗ ██████╗       ██████╗  ██████╗ ████████╗███████╗
╚██╗██╔╝██╔═══██╗██╔══██╗      ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝
 ╚███╔╝ ██║   ██║██████╔╝${MAGENTA}█████╗$NC██║  ██║██║   ██║   ██║   ███████╗
 ██╔██╗ ██║   ██║██╔══██╗${MAGENTA}╚════╝$NC██║  ██║██║   ██║   ██║   ╚════██║
██╔╝ ██╗╚██████╔╝██║  ██║      ██████╔╝╚██████╔╝   ██║   ███████║
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝      ╚═════╝  ╚═════╝    ╚═╝   ╚══════╝"

echo -e "[~] ${GREEN}Updating repos...${NC}"

# Update debian and get standard repository programs
sudo apt update && sudo apt full-upgrade -y
#sudo apt update

echo -e "[~] ${GREEN}Copying dotfiles...${NC}"
./copy.sh

echo -e "[~] ${GREEN}Fetching APT programs...${NC}"

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo -e "[~] ${GREEN}Installing: ${1}...${NC}"
    sudo apt install -y $1
  else
    echo -e "[!] ${ORANGE}Already installed: ${1}${NC}"
  fi
}

# Basics
install flameshot
install git
install neofetch
install feh
install picom

# Terminal
install alacritty
# Set as default terminal for nemo/thunar/etc.
sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty
install zsh
# Set zsh as the default shell
sudo chsh -s $(which zsh) $USER


# Window Manager Additions
install bspwm
install dmenu
install rofi
install polybar
install nemo

# Set default nemo terminal
gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty
# Set nemo as default
xdg-mime default nemo.desktop inode/directory

install tmux
install lightdm-gtk-greeter-settings

echo -e "[~] ${GREEN}Running program scripts...${NC}"
# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

echo -e "[~] ${GREEN}Cleaning up packages...${NC}"
sudo apt upgrade -y
sudo apt autoremove -y

echo    " ----------------------------"
echo -e "| Please ${RED}logout${NC}, then select |"
echo -e "| ${MAGENTA}bspwm${NC} within the lightdm   |"
echo    "| greeters session menu.     |"
echo -e "|                       -${GREEN}xor${NC} |"
echo    " ----------------------------"
echo    "            /"
echo    "           /"
# Print end banner
/usr/local/bin/pokemon-colorscripts -n porygon --no-title
