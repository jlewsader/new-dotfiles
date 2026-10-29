#!/usr/bin/env bash
set -e

echo "[*] Updating package lists for headless LXC..."
sudo apt-get update && sudo apt-get install -y \
  curl \
  wget \
  git \
  zsh \
  htop \
  tmux \
  neovim \
  fzf \
  ripgrep \
  bat

# Ensure zsh is default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "[*] Changing default shell to zsh..."
  sudo chsh -s "$(which zsh)" "$USER"
fi

# Apply chezmoi dotfiles directly inside the container
if ! command -v chezmoi &>/dev/null; then
  echo "[*] Installing chezmoi..."
  sh -c "$(curl -fsSL https://get.chezmoi.io)" -- -b "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
fi

echo "[*] Initializing dotfiles from your repo..."
chezmoi init --apply https://github.com/jlewsader/new-dotfiles.git
