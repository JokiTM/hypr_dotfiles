#!/usr/bin/env fish

echo "Installing yay"
sudo pacman -S yay --noconfirm

echo "Updating the System"
yay --noconfirm

echo "Installing caelestia dotfiles"
echo "Downloading repo"
git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
echo "Installing dots"
~/.local/share/caelestia/install.fish --spotify --discord --vscode=code --aur-helper=yay --noconfirm

echo "Finished installing caelestia dotifles"

echo "Installing personalized dots"

echo "Installing caelestia and hyprland dots..."
cp -r caelestia ~/.config/

echo "Installing NeoVim"
sudo pacman -S neovim --noconfirm
echo "Installing nvim dots..."
cp -r nvim ~/.config/
echo "Finished."
