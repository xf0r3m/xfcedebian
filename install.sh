#!/bin/bash

set -e

# Pakiet conky jest pakietem wirtualnym zapewnianym przez:
#  conky-std 1.19.5-1
#  conky-cli 1.19.5-1
#  conky-all 1.19.5-1
#Należy jednoznacznie wybrać jeden z nich do instalacji.

sudo apt install -y ranger git qmmp vlc qutebrowser tmux keepassxc conky-all vim-gtk3 claws-mail;
if [ "$1" ] && [ "$1" = "--immudex" ]; then

	mkdir /etc/skel/.config;
	cp -rvv xfce4 /etc/skel/.config;
	cp -vv xfce4/xfconf/xfce-perchannel-xml/xfce4-panel-immudex.xml /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml;
  rm /etc/skel/.config/xfce4/panel/launcher-5/17578428061.desktop;
	cp -vv mimeapps.list /etc/skel/.config;
	
	mkdir /etc/skel/.config/autostart;
	cp conky.desktop /etc/skel/.config/autostart;

	cp vimrc /etc/skel/.vimrc;
	cp conkyrc-immudex /etc/skel/.conkyrc;
	if [ -f /etc/skel/.face ]; then rm /etc/skel/.face; fi
	ln -s /usr/share/images/desktop-base/immudex_xfce_greeter_logo.png /etc/skel/.face;
	cp icons/* /usr/share/icons;
	ln -s /usr/share/icons/changes-prevent.png /usr/share/icons/padlock-icon.png;
else
	if [ ! -d /home/${USER}/.config ]; then
		mkdir /home/${USER}/.config;
	fi
	cp -rvv xfce4 /home/${USER}/.config;
  rm /home/${USER}/.config/xfce4/panel/launcher-5/16844254192.desktop;
	cp -vv mimeapps.list /home/${USER}/.config;
	
	if [ ! -d /home/${USER}/.config/autostart ]; then
		mkdir /home/${USER}/.config/autostart;
	fi
	cp conky.desktop /home/${USER}/.config/autostart;

	cp vimrc /home/${USER}/.vimrc;
	cp conkyrc /home/${USER}/.conkyrc;
	if [ -f /home/${USER}/.face ]; then rm /home/${USER}/.face; fi
	ln -s  /usr/share/icons/vendor/256x256/emblems/emblem-vendor.png /home/${USER}/.face;

fi

sudo cp -vv mimeinfo.cache /usr/share/applications;
sudo mkdir /usr/share/fonts/truetype/meslo;
sudo tar -xzvf fonts.tgz -C /usr/share/fonts/truetype/meslo;

sudo rm -rf /etc/lightdm;
sudo cp -rvv lightdm /etc;
if [ "$1" ] && [ "$1" = "--immudex" ]; then
  sudo mv /etc/lightdm/lightdm-gtk-greeter-immudex.conf /etc/lightdm/lightdm-gtk-greeter.conf;
else
  sudo rm /etc/lightdm/lightdm-gtk-greeter-immudex.conf
fi

sudo rm /usr/share/images/desktop-base/default;
sudo cp -rvv images/* /usr/share/images/desktop-base;
sudo ln -s /usr/share/images/desktop-base/d13_wallpaper.png /usr/share/images/desktop-base/default;
if [ -f /usr/share/backgrounds/xfce/xfce-x.svg ]; then
  sudo rm /usr/share/backgrounds/xfce/xfce-x.svg;
  sudo ln -s /usr/share/images/desktop-base/d13_wallpaper.png /usr/share/backgrounds/xfce/xfce-x.svg;
fi
sudo sed -i 's/lightdm_wallpaper.jpg/d13_wallpaper.png/' /etc/lightdm/lightdm-gtk-greeter.conf;

