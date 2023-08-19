#!/bin/bash

set -e

apt install -y ranger git qmmp vlc lynx tmux pass qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager conky vim-gtk3 mutt;

mkdir /etc/skel/.config;
cp -rvv xfce4 /etc/skel/.config;
cp -vv mimeapps.list /etc/skel/.config;
cp -vv mimeinfo.cache /usr/share/applications;

mkdir /etc/skel/.config/autostart;
cp conky.desktop /etc/skel/.config/autostart;

cp vimrc /etc/skel/.vimrc;
cp conkyrc /etc/skel/.conkyrc;

tar -xzvf fonts.tgz -C /etc/skel;

rm -rf /etc/lightdm;
cp -rvv lightdm /etc;

rm /usr/share/images/desktop-base/default;
cp -rvv images/* /usr/share/images/desktop-base;
ln -s /usr/share/images/desktop-base/d13_wallpaper.png /usr/share/images/desktop-base/default;
if [ -f /etc/skel/.face ]; then rm /etc/skel/.face; fi
ln -s /usr/share/images/desktop-base/immudex_xfce_greeter_logo.png /etc/skel/.face;

cp icons/* /usr/share/icons;
ln -s /usr/share/icons/changes-prevent.png /usr/share/icons/padlock-icon.png;
