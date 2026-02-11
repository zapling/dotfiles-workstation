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

if [[ ! -d "$HOME/R" ]]; then
    mkdir "$HOME/R"
fi

if [[ ! -d "$HOME/P" ]]; then
    mkdir "$HOME/P"
fi

link() {
    [[ -e $2 ]] || ln -s "$1" "$2"
}

localbin="$HOME/.local/bin"

mkdir -p "$localbin"

link "$dotfiles/oh-my-zsh.sunaku-zapling.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/sunaku-zapling.zsh-theme"
link "$dotfiles/.gitconfig" "$HOME"
link "$dotfiles/.zshrc" "$HOME"
link "$dotfiles/.zshenv" "$HOME"

link "$dotfiles/.local/bin/host" "$localbin/"
link "$dotfiles/.local/bin/arch" "$localbin/"

link "$dotfiles/.config/alacritty" "$HOME/.config/"
link "$dotfiles/.config/git" "$HOME/.config/"
link "$dotfiles/.config/i3blocks" "$HOME/.config"
link "$dotfiles/.config/kanshi" "$HOME/.config"
link "$dotfiles/.config/nvim_zapling" "$HOME/.config"
link "$dotfiles/.config/sway" "$HOME/.config"
link "$dotfiles/.config/wofi" "$HOME/.config"
link "$dotfiles/.config/zsh" "$HOME/.config"
