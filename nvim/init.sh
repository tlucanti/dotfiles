#!/bin/bash

set -e

rm -rf ~/.config/nvim/
rm -rf ~/.local/share/nvim/
rm -rf ~/.local/state/nvim/
rm -rf ~/.cache/nvim/

mkdir -p ~/.config/nvim
cp ./init.lua ~/.config/nvim/

if ! [ -e JetBrainsMono.zip ]; then
	wget 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip'
fi
