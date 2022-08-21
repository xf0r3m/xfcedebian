#!/bin/bash

sudo apt install ranger git qmmp vlc lynx tmux pass qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager

cp -rvv home/xf0r3m/.cache /etc/skel;

cp -rvv home/xf0r3m/.config /etc/skel;

sudo rm -rf /etc/lightdm;
sudo cp -rvv etc/lightdm /etc;

cp -rvv home/xf0r3m/Obrazy /etc/skel;


screen=$(xrandr | grep '\ connected\ ' | awk '{printf $1}');
sed -i "s/eDP-1/$screen/" /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml;

