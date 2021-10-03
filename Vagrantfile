Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.memory = 6192
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["setextradata", :id, "CustomVideoMode1", "1680x1050x32"]
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "persistent-data", "/vagrant/persistent-data"
  config.vm.synced_folder "provision", "/vagrant/provision"

    # Add `vagrant` to Administrator
  config.vm.provision :shell, inline: "sudo usermod -a -G sudo vagrant"

  # require plugin https://github.com/leighmcculloch/vagrant-docker-compose
  config.vagrant.plugins = "vagrant-docker-compose"

  # install docker and docker-compose
  config.vm.provision :docker
  config.vm.provision :docker_compose

  config.vm.provision 'shell', privileged: false, path: 'provision/base.sh', name: 'base.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/dotnet.sh', name: 'dotnet.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/git.sh', name: 'git.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/gnome.sh', name: 'gnome.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/google-chrome.sh', name: 'google-chrome.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/nodejs.sh', name: 'nodejs.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/vim.sh', name: 'vim.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/vs-code.sh', name: 'vs-code.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/zsh.sh', name: 'zsh.sh'


  # Restart
  config.vm.provision :shell, inline: "sudo shutdown -r now"
end
