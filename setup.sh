#!/bin/bash

set -e

echo APT INSTALL
sudo apt-get install -y vim git zsh curl wget python3 python3-venv ripgrep tldr build-essential

# clone this repo first
echo CLONE DOTFILES
mkdir -p ~/git
if ! [ -e ~/git/dotfiles ]; then
	git clone https://github.com/tlucanti/dotfiles.git ~/git/dotfiles
fi

# configs
echo INSTALL CONFIGS
cd ~/git/dotfiles/conf && ./install.sh

# nvim
if ! [ -e ~/git/nvim ]; then
	echo INSTALL NVIM
	mkdir -p ~/git/nvim
	wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -O ~/git/nvim/nvim.appimage
	chmod +x ~/git/nvim/nvim.appimage
	echo 'extracting nvim.appimage' && cd ~/git/nvim && ./nvim.appimage --appimage-extract > /dev/null
	sudo ln -sf ~/git/nvim/squashfs-root/usr/bin/nvim /usr/local/bin/nvim
	cd ~/git/dotfiles/nvim && ./init.sh
fi
