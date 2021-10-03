#!/bin/sh
sudo apt-get install -y libxss1
wget https://go.microsoft.com/fwlink/?LinkID=760868 -O ~/vs-code.deb
sudo dpkg -i ~/vs-code.deb
