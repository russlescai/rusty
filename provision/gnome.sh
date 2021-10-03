#!/bin/sh
sudo apt install -y --no-install-recommends ubuntu-desktop
sudo apt install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

dconf load /org/gnome/terminal/legacy/profiles:/ < /vagrant/provision/config/gnome-terminal-profiles.dconf