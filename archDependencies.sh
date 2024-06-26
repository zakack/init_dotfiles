#!/bin/bash

## update database
pacman -Syy

## install yay if necessary
echo '#######################'
echo 'installing yay'
echo '#######################'
if [ ! -x /usr/bin/yay ]; then
	git clone https://aur.archlinux.org/yay.git
	if [ -d "$(pwd)/yay" ]; then
		cd yay
		makepkg -si
		cd ..
		rm -rf yay
	fi
else
	echo 'nevermind, yay already installed...'
fi

echo '#######################'
echo 'installing base applications'
echo '#######################'
yay -S --noconfirm --needed \
	fish \
	alacritty \
	pipewire-alsa \
	octopi \
	picom \
	rofi \
	dunst \
	python-pywal \
	polybar \
	vim \
	neovim \
	neovim-lspconfig \
	dfc \
	fzf \
	fd \
	maim \
	bat \
	dust \
	eza \
	zoxide \
	xdotool \
	tmux \
	unrar \
	p7zip \
	cronie \
	rclone

#TODO: add nix support
echo '#######################'
echo 'installing development and util applications'
echo '#######################'
yay -S --noconfirm --needed \
	nodejs \
	npm \
	python-pip \
	python-virtualenv \
	spotify \
	neofetch \
	btop \
	docker \
	ranger \
	github-cli

echo '#######################'
echo 'installing fonts'
echo '#######################'
yay -S --noconfirm --needed \
	ttf-iosevka \
	ttf-fira-code \
	ttf-firacode-nerd \
	ttf-jetbrains-mono \
	ttf-jetbrains-mono-nerd \
	ttf-nerd-fonts-symbols

# install docker/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER

# set permissions for spicetify
sudo chgrp users /opt/spotify
sudo chgrp -R users /opt/spotify/Apps
sudo chmod 775 /opt/spotify
sudo chmod 775 -R /opt/spotify/Apps

echo '#######################'
echo 'installing additional applications'
echo '#######################'
yay -S --noconfirm --needed \
	starship \
	xclip \
	spicetify-cli \
	gimp \
	vivaldi \
	vivaldi-ffmpeg-codecs \
	firefox-developer-edition \
	vlc \
	imgur-screenshot-git \
	sxiv \
	mpv \
	youtube-dl \
	mupdf \
	surf \
	zathura \
	zathura-pdf-poppler
