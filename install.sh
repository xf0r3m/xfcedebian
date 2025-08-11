#!/bin/bash

set -e

# Pakiet conky jest pakietem wirtualnym zapewnianym przez:
#  conky-std 1.19.5-1
#  conky-cli 1.19.5-1
#  conky-all 1.19.5-1
#Należy jednoznacznie wybrać jeden z nich do instalacji.

apt install -y ranger git qmmp vlc lynx tmux pass conky-all vim-gtk3 mutt;

mkdir /etc/skel/.config;
cp -rvv xfce4 /etc/skel/.config;
cp -vv mimeapps.list /etc/skel/.config;
cp -vv mimeinfo.cache /usr/share/applications;

mkdir /etc/skel/.config/autostart;
cp conky.desktop /etc/skel/.config/autostart;

cp vimrc /etc/skel/.vimrc;
cp conkyrc /etc/skel/.conkyrc;

mkdir /usr/share/fonts/truetype/meslo;
tar -xzvf fonts.tgz -C /usr/share/fonts/truetype/meslo;

rm -rf /etc/lightdm;
cp -rvv lightdm /etc;

rm /usr/share/images/desktop-base/default;
cp -rvv images/* /usr/share/images/desktop-base;
ln -s /usr/share/images/desktop-base/d13_wallpaper.png /usr/share/images/desktop-base/default;
if [ -f /usr/share/backgrounds/xfce/xfce-x.svg ]; then
  rm /usr/share/backgrounds/xfce/xfce-x.svg;
  ln -s /usr/share/images/desktop-base/d13_wallpaper.png /usr/share/backgrounds/xfce/xfce-x.svg;
fi
if [ -f /etc/skel/.face ]; then rm /etc/skel/.face; fi
ln -s /usr/share/images/desktop-base/immudex_xfce_greeter_logo.png /etc/skel/.face;
sed -i 's/lightdm_wallpaper.jpg/d13_wallpaper.png/' /etc/lightdm/lightdm-gtk-greeter.conf;

cp icons/* /usr/share/icons;
ln -s /usr/share/icons/changes-prevent.png /usr/share/icons/padlock-icon.png;
