#!/bin/bash

sudo apt install -y lightdm-gtk-greeter-settings;

sudo cp -rvv images/* /usr/share/images/desktop-base;
sudo cp -rvv icons/* /usr/share/icons;

sudo cp -prvv config/* /etc/lightdm;

user=$(getent passwd 1000 | cut -d ":" -f 1);

sudo cp -rvv xfce4 /home/${user}/.config;
sudo chown -R ${user}:${user} /home/${user};
