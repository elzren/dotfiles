# Arch linux dotfiles

## Installation

```bash
cat packages.txt | xargs sudo pacman -Syuv --noconfirm
yay -S ags-hyprpanel-git
```
## Setup

```bash
stow -Rvt ~ */
systemctl enable ly
gsettings set org.gnome.desktop.interface gtk-theme "rose-pine-gtk"
```
