# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Use ubuntu trusty64
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false

  # Foward SmartFox 8080 9933 port
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 9933, host: 9933
  config.vm.hostname="vagrant-smartfox"

  # Use default vagrant synced folder
  config.vm.synced_folder ".", "/vagrant"

  # Allocate 1GB memory and 1 core CPU to vagrant virtual machine
  config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
  end

  # Provisoning with docker and image timlien/docker-smartfox
  config.vm.provision "docker" do |d|
    d.pull_images "timlien/docker-smartfox"
    d.run "timlien/docker-smartfox", 
      args: "-d -p 8080:8080 -p 9933:9933 --name vagrant_smartfox -v /vagrant:/vagrant"
  end

  # Initialize docker container when boot up
  config.vm.provision "shell", path: "./boot.sh", run: "always"

end