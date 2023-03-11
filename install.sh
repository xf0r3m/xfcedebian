#!/bin/bash

set -e

apt install -y ranger git qmmp vlc lynx tmux pass qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager conky picom;

mkdir /etc/skel/.config;
cp -rvv xfce4 /etc/skel/.config;

mkdir /etc/skel/.config/autostart;
cp conky.desktop /etc/skel/.config/autostart;

cp vimrc /etc/skel/.vimrc;
cp conkyrc /etc/skel/.conkyrc;

cp -rvv Pulpit /etc/skel;
tar -xzvf fonts.tgz -C /etc/skel;

rm -rf /etc/lightdm;
cp -rvv lightdm /etc;

rm /usr/share/images/desktop-base/default;
cp -rvv images/* /usr/share/images/desktop-base;
ln -s /usr/share/images/desktop-base/altai_1920x1080.png /usr/share/images/desktop-base/default;

cp icons/* /usr/share/icons;
ln -s /usr/share/icons/changes-prevent.png /usr/share/icons/padlock-icon.png;
