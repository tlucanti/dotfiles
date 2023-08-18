rm -rf ~/.config/nvim/
rm -rf ~/.local/share/nvim/
rm -rf ~/.local/state/nvim/
rm -rf ~/.cache/nvim/

mkdir ~/.config/nvim
cp ./init.lua ~/.config/nvim/

echo "INSTALL node-js npm"

wget 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/AurulentSansMono.zip'
