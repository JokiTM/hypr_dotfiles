#!/usr/bin/env fish

echo "Installing caelestia dotfiles"
echo "Downloading repo"
git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
echo "Installing dots"
~/.local/share/caelestia/install.fish --spotify --discord --noconfirm

echo "Finished installing caelestia dotifles"

echo "Installing personalized dots"

cp -r caelestia ~/.config/caelestia/
