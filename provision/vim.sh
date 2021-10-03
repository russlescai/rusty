#!/bin/sh
# sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install vim #vim-gtk
touch /home/$(whoami)/.bashrc
echo "export EDITOR=vim" >> /home/$(whoami)/.bashrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp /vagrant/provision/config/.vimrc ~/.vimrc

vim +'PlugInstall --sync' +qa
