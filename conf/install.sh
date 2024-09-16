#!/bin/bash

set -e

if [[ -e ~/.vimrc ]]; then
	cp ~/.vimrc ./vimrc.backup
fi
if [[ -e ~/.zshrc ]]; then
	cp ~/.zshrc ./zshrc.backup
fi
if [[ -e ~/.zsh_plugins.txt ]]; then
	cp ~/.zsh_plugins.txt ./zsh_plugins.txt.backup 2> /dev/null
fi
if [[ -e ~/.gdbinit ]]; then
	cp ~/.gdbinit ./gdbinit.backup 2> /dev/null
fi
if [[ -e ~/.lldbinit ]]; then
	cp ~/.lldbinit ./lldbinit.backup 2> /dev/null
fi
if [[ -e ~/.pdbrc ]]; then
	cp ~/.pdbrc ./pdbrc.backup 2> /dev/null
fi

cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cp zsh_plugins.txt ~/.zsh_plugins.txt
cp gdbinit ~/.gdbinit
cp lldbinit ~/.lldbinit
cp pdbrc ~/.pdbrc

