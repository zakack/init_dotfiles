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
  arandr \
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
  yazi \
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
  fastfetch \
  neofetch \
  btop \
  docker \
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

echo '#######################'
echo 'installing additional applications'
echo '#######################'
yay -S --noconfirm --needed \
  starship \
  xclip \
  gimp \
  firefox \
  vlc \
  imgur-screenshot-git \
  sxiv \
  mpv \
  mupdf \
  surf
