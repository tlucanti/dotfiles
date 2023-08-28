rm -rf ~/.config/nvim/
rm -rf ~/.local/share/nvim/
rm -rf ~/.local/state/nvim/
rm -rf ~/.cache/nvim/

mkdir ~/.config/nvim
cp ./init.lua ~/.config/nvim/

echo "INSTALL python3.10-venv"
echo "INSTALL ripgrep"

wget 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/AurulentSansMono.zip'
