#!/usr/bin/env fish

echo "Installing caelestia dotfiles"
echo "Downloading repo"
git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
echo "Installing dots"
~/.local/share/caelestia/install.fish --spotify --discord --noconfirm

echo "Finished installing caelestia dotifles"

echo "Installing personalized dots"

echo "Installing caelestia and hyprland dots..."
cp -r caelestia ~/.config/caelestia/

echo "Installing nvim dots..."
cp -r nvim ~/.config/nvim/
