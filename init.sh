#!/bin/bash

source ./Scripts/getDistro.sh
machine=$(./Scripts/machine.sh)

echo "Initializing dotfiles..."
echo "Environment: $OS"

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

# spicetify setup
spicetify &&
	spicetify config current_theme catppuccin &&
	spicetify config color_scheme macchiato &&
	spicetify config inject_css 1 inject_theme_js 1 replace_colors 1 overwrite_assets 1 &&
	spicetify backup apply enable-devtools

ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.ignore ~/.ignore

# tmux config
#TODO: Learn to use tmux
[ ! -d "$HOME/.tmux/plugins/tpm" ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.tmux.conf.arch ~/.tmux.conf.local

#TODO: Setup a similar note-taking setup with Google Drive
# set up dropbox-stored note taking
# if [ -d "$HOME/Drive" ]; then
#   touch $HOME/Drive/note.txt
#   ln -sf $HOME/Drive/note.txt $HOME/note.txt
# fi

# copy scripts
sudo cp -rf --symbolic-link $(pwd)/Scripts/* /usr/local/bin/

# Crontabs (only non-mac OS)
#if [[ $OS != 'Darwin' ]];then
#  sudo touch /var/log/cron.log
#  sudo cp -rf --symbolic-link $(pwd)/cron/* /etc/cron.d/
#fi

# set shell as fish
chsh -s /usr/bin/fish

# set up vim/neovim
mkdir -p ~/.config/vim/backup_files
mkdir -p ~/.config/vim/undo_files

# install node js and utils
# if [ ! -d "$HOME/.nvm" ]; then
# 	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.3/install.sh | bash
# fi

# copy bin directory
sudo cp -rf --symbolic-link $(pwd)/bin/* /usr/local/bin

echo "Init complete"
