# Kali dots

This repo contains my dotfile installer for spinning up BSPWM on kali linux. The scripts are **highly tweakable**, so feel free to make your own changes! The currently theme chosen theme is [Gruvbox Material](https://github.com/TheGreatMcPain/gruvbox-material-gtk) with [Patched IBM Plex Mono](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/IBMPlexMono).
> _Inspired by [Victoria Drakes](https://github.com/victoriadrake/dotfiles/tree/ubuntu-19.10/scripts) dotfile scripts :)_

![scrot](https://github.com/XORMANCER/kali-dots/blob/main/screenshot.png)

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

4. Grab some matching GUI themes, if desired.
* [Firefox](https://addons.mozilla.org/en-US/firefox/addon/gruvbox-medium-dark/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search)
* [Discord](https://github.com/patrykf03/Discord-Gruvbox/blob/main/duvbox.theme.css)

## Common tweaks

To adopt these dotfiles to your personal needs, check out some common changes below.

<details>
  <summary>Expand</summary>
  
  ### GTK and icon themes 
  Themes and icons are controlled by `.gtkrc-2.0` and `.config/gtk-3.0/settings.ini`.

  ### HiDPI
  If you have a monitor which utilizes a HiDPI resolution, alacritty may not properly scale itself. Increasing the multiplier within `.config/alacritty/alacritty.yml` may help.
  ```bash
  WINIT_X11_SCALE_FACTOR: "1"
  ```
  ### Polybar
  The width is set by default to a percentage of your monitors resolution. To manaually set a width, modify the following within `.config/polybar.config.ini`.
  ```css
  [bar/main]
  #EDIT FOR YOUR MONITOR
  width = 99%
  height = 32px
  ```

  ### Virtual Machine support
  For VMWare users, copy and paste support can be enabled by uncommenting the following line in `.config/bspwm/bsprc`. This is enabled by default.
  ```bash
  vmware-user-suid-wrapper &
  ```

  ### Wallpapers and mugshots
  To set custom images, replace `mug.png`, `lock.png`, and `background.png` within `.greeter`.

</details>
  
## Why is this included?

For context as to why each file is included, reference the file tree below.

<details>
  <summary>Expand</summary>
  
  ### root (/)
  * `.gtkrc-2.0` - Sets the gruvbox theme
  * `.tmux.conf` - Tmux package manager and sane defaults
    * CTRL + SPACE
      * New prefix key
    * VIM bindings for pane movement (h,j,k,l) and pane resizing by holding prefix
  
  ### .config folder (.config)
  * `/alacritty` - Contains tweaks for gruvbox theme
  * `/bspwm` - Window manager
  * `/gtk-3.0` - Sets the gruvbox GTK theme
  * `/nvim` - LazyVIM, gruvbox theme
  * `/picom` - Default picom with rounded borders
  * `/polybar` - Status bar
  * `/sxhkd` - Keybind handler
    * SUPER + SPACE
      * launches Rofi w/ Gruvbox theme
    * SUPER + RETURN
      * launches Alacritty

  ### .greeter folder (.greeter)
  * `lightdm-gtk-greeter.conf` - Contains tweaks for the lightdm greeter (default login screen)
  * `mug.png` - User icon
  * `background.png` - Desktop background
  * `lock.png` - Lockscreen background

  ### programs (/scripts/programs)
  * `<FILENAME>.sh` - A shell script for installing programs outside of APT, called by `install.sh`.
    * Current programs:
      * neovim, oh-my-zsh, pokemon-colorscripts, tmux TPM
  
  ### scripts (/scripts)
  * `copy.sh` - Called by `install.sh`, copies user file(s) to proper location(s).
  * `install.sh` - Automated installer, installs user programs within `/scripts/programs`.

</details>
