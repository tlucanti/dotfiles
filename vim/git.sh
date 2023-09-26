
git config --global core.editor "nvim"
git config --global user.email prototype3628800@yandex.ru
git config --global user.name tlucanti
git config --global commit.gpgsign true
git config --global user.signingkey $(gpg --list-secret-keys --keyid-format LONG | grep '^sec' -A1 | grep -v '^sec')
