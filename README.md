# Kali dots

This repo contains my dotfile installer for spinning up BSPWM on kali linux. The scripts are **highly tweakable**, so feel free to make your own changes!

> _Inspired by [Victoria Drakes](https://github.com/victoriadrake/dotfiles/tree/ubuntu-19.10/scripts) dotfile scripts :)_  

**Theme**: [Gruvbox Material]([https://github.com/AlessandroYorba/Alduin](https://github.com/TheGreatMcPain/gruvbox-material-gtk))  
**Window Manager**: [bspwm](https://github.com/baskerville/bspwm)  
**Font** : [Patched IBM Plex Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/IBMPlexMono)  
**Firefox theme**: [Gruvbox Dark]([https://color.firefox.com/?theme=XQAAAAJrAQAAAAAAAABBqYhm849SCia6aSqEGccwS-xMDPr2oHyUaaq-qy5QgqeHG4K15Qcgxy_eM_IX1p-_21bekUjgqHQFWSEAh_LOUC2M1iGA6iXGON3pFWZXQm27d4Q0FMo3tMX94mmmFxWMy8x1cXJc-DybUfhN3YtmiVE_xyjCBCp9DdlebJoVDmSjhkrktYSYZUldkmZMM6DA5FzCJwBSicRQBApJOezPzc4Op9nvSOYXmg8-d6AYOfEWxv-Y10AA](https://addons.mozilla.org/en-US/firefox/addon/gruvbox-medium-dark/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)) (Optional)  

![scrot](https://github.com/XORMANCER/kali-dots/blob/main/desktop.png)

## Usage
1. Grab a copy of Kali linux.
2. Clone this repo
  ```bash
  git clone https://github.com/XORMANCER/kali-dots.git
  ```
3. Move to the dotfiles directory, and run the installer
```bash
  cd kali-dots/scripts
  ./install.sh
```

## Customization
### Wallpapers and user pictures
The user icon and background files can be found at `.greeter/mug.png`, `.greeter/lock.png`, and `.greeter/background.png`.

### GTK and icon themes 
Parameters are set within `.gtkrc-2.0` and `.config/gtk-3.0/settings.ini`.

### Virtual Machine support
For VMWare users, copy and paste support can be enabled by uncommenting the following line in `.config/bspwm/bsprc`. This is enabled by default.
```bash
#vmware-user-suid-wrapper &
```
### HiDPI
If you have a monitor which utilizes a HiDPI resolution, alacritty may not properly scale itself. Increasing the multiplier within `.config/alacritty/alacritty.yml` may help.
```bash
WINIT_X11_SCALE_FACTOR: "1"
```
### Polybar
The polybar configuration uses a dynamic width that adjusts to your resolution. To adjust, modify the following within `.config/polybar.config.ini`.
```bash
[bar/main]
#EDIT FOR YOUR MONITOR
width = 99%
height = 32px
```

## Contents

Below is a brief overview of the changes made to common defaults, along with key files of note.

### root (/)
* **.gtkrc-2.0** - Sets the gruvbox them
* **.tmux.conf** - Tmux package manager and sane defaults
  * CTRL + SPACE
    * New prefix key
  * VIM bindings for pane movement (h,j,k,l) and pane resizing by holding prefix

### .config folder (.config)
* **alacritty** - Contains tweaks for gruvbox theme
* **bspwm** - Default config plus the following tweaks:
  * SUPER + SPACE
    * launches Rofi w/ Gruvbox theme
  * SUPER + RETURN
    * launches Alacritty
* **gtk-3.0** - Sets the gruvbox theme
* **nvim** - LazyVIM
* **picom** - picom with rounded borders
* **polybar** - Status bar
* **Sxhkd** - Keybind handler

### .greeter folder (.greeter)
* `lightdm-gtk-greeter.conf` - Contains tweaks for the lightdm greeter (default login screen)
* `mug.png` - User icon
* `background.png` - Desktop background
* `lock.png` - Lockscreen background

### scripts (/scripts)
* `copy.sh` - Called by `install.sh`, copies user file(s) to proper location(s).
* `install.sh` - Automated installer, installs via APT and user programs via `/scripts/programs`.
 
### programs (/scripts/programs)
* `<FILENAME>.sh` - A shell script used to install a program outside of APT, called by `install.sh`.
  * Current programs:
    * neovim, oh-my-zsh, pokemon-colorscripts, tmux TPM
