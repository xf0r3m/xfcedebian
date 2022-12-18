#!/bin/bash

set -e

apt install -y ranger git qmmp vlc lynx tmux pass qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager

cp -rvv home/xf0r3m/.config /etc/skel;

cp home/xf0r3m/.vimrc /etc/skel;

rm -rf /etc/lightdm;
cp -rvv etc/lightdm /etc;

rm /usr/share/images/desktop-base/default;
cp -rvv home/xf0r3m/Obrazy/* /usr/share/images/desktop-base;
ln -s /usr/share/images/desktop-base/desktop-background /usr/share/images/desktop-base/default;

