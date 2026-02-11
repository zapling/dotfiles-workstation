#!/usr/bin/env bash

set -euo pipefail # Exit on error, unset variable and pipe failure.

dotfiles="$HOME/dotfiles"

if [[ ! -d "$dotfiles" ]]; then
    git clone git@github.com:zapling/dotfiles-workstation.git "$dotfiles"
fi

# Install oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    rm "$HOME/.zshrc"
    rm "$HOME.zshrc.pre-oh-my-zsh"
fi

localbin="$HOME/.local/bin"

mkdir -p "$localbin"

ln -s "$dotfiles/.gitconfig" "$HOME"
ln -s "$dotfiles/.zshrc" "$HOME"
ln -s "$dotfiles/.zshenv" "$HOME"

ln -s "$dotfiles/.local/bin/host" "$localbin/"
ln -s "$dotfiles/.local/bin/arch" "$localbin/"

ln -s "$dotfiles/.config/alacritty" "$HOME/.config/"
ln -s "$dotfiles/.config/git" "$HOME/.config/"
ln -s "$dotfiles/.config/i3blocks" "$HOME/.config"
ln -s "$dotfiles/.config/kanshi" "$HOME/.config"
ln -s "$dotfiles/.config/nvim_zapling" "$HOME/.config"
ln -s "$dotfiles/.config/sway" "$HOME/.config"
ln -s "$dotfiles/.config/wofi" "$HOME/.config"
ln -s "$dotfiles/.config/zsh" "$HOME/.config"
