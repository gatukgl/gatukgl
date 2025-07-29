#!/bin/sh

# Homebrew install for OSX
echo "Update Brew"
brew update
brew upgrade

# Mac App Store
brew install mas 

# Programming Language
brew install node
brew install nvm
brew install pnpm
brew install yarn
brew install uv
brew install pyenv

brew bundle install --file="$(pwd)/brew-apps.sh"

# Customization terminal
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# LunarVim
echo "🚀 Installing LunarVim dotfiles..."
mkdir -p ~/.config/lvim
ln -sf $(pwd)/lvim/config.lua ~/.config/lvim/config.lua
ln -sf $(pwd)/lvim/plugins.lua ~/.config/lvim/plugins.lua
echo "✅ Config linked. Restart lvim or run :PackerSync inside it."
