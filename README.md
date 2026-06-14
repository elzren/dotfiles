# Arch linux dotfiles

## Installation

```bash
cat packages.txt | xargs sudo pacman -Syuv --noconfirm
```

## Setup

```bash
stow -Rvt ~ */
systemctl enable sddm
```
