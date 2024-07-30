#!/bin/bash

echo "Initializing dotfiles..."

# apply config
rm -f \
  ~/.xinitrc \
  ~/.xprofile \
  ~/.Xresources \
  ~/.gitconfig

# symlink .config directory and contents to $HOME/.config
cp -rf --symbolic-link $(pwd)/.config/* ~/.config/

# symlink .local directory and contents to $HOME/.local
cp -rf --symbolic-link $(pwd)/.local/* ~/.local/

cp -rf --symbolic-link $(pwd)/.ssh/* ~/.ssh/

# copy x files for arch theme etc.
ln -sf $(pwd)/.xinitrc ~/.xinitrc
ln -sf $(pwd)/.xprofile ~/.xprofile
ln -sf $(pwd)/.Xresources ~/.Xresources

ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.ignore ~/.ignore

# tmux config
#TODO: Learn to use tmux
[ ! -d "$HOME/.tmux/plugins/tpm" ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.tmux.conf.arch ~/.tmux.conf.local

# copy scripts
sudo cp -rf --symbolic-link $(pwd)/Scripts/* /usr/local/bin/

# set shell as fish
chsh -s /usr/bin/fish

# set up vim/neovim
mkdir -p ~/.config/vim/backup_files
mkdir -p ~/.config/vim/undo_files

# copy bin directory
sudo cp -rf --symbolic-link $(pwd)/bin/* /usr/local/bin

echo "Init complete"
