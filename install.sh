#!/bin/bash

sudo apt install -y lightdm-gtk-greeter-settings;

sudo cp -rvv images/* /usr/share/images/desktop-base;
sudo cp -rvv icons/* /usr/share/icons;

sudo cp -prvv config/* /etc/lightdm;

user=$(getent passwd 1000 | cut -d ":" -f 1);

sudo mkdir /etc/skel/.config;
sudo cp -rvv xfce4 /etc/skel/.config;

sudo userdel -r $user;
sudo useradd -m -s /bin/bash $user;
sudo cp -rvv launchers/* /home/${user}/Pulpit;
sudo chown -R ${user}:${user} /home/${user};
echo "${user}:${user}1" | chpasswd $user;
