#!/bin/bash

set -e

cp ~/.vimrc ./vimrc.backup 2> /dev/null
cp vimrc ~/.vimrc

cp ~/.zshrc ./zshrc.backup 2> /dev/null
cp zshrc ~/.zshrc

cp ~/.zsh_plugins.txt ./zsh_plugins.txt.backup 2> /dev/null
cp zsh_plugins.txt ~/.zsh_plugins.txt

cp ~/.gdbinit ./gdbinit.backup 2> /dev/null
cp gdbinit ~/.gdbinit

cp ~/.lldbinit ./lldbinit.backup 2> /dev/null
cp lldbinit ~/.lldbinit

cp ~/.pdbrc ./pdbrc.backup 2> /dev/null
cp pdbrc ~/.pdbrc

