# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Use ubuntu trusty64
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false

  # Foward SmartFox 5000/VisualVM 8080/admin 8787/debug 9933/server port
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8787, host: 8787
  config.vm.network "forwarded_port", guest: 9933, host: 9933
  config.vm.hostname="vagrant-smartfox"

  # Use default vagrant synchronized folder
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
      args: "-d --name vagrant_smartfox -p 5000:5000 -p 8080:8080 -p 8787:8787 -p 9933:9933 -v /vagrant/extensions:/var/SmartFoxServer_2X/SFS2X/extensions -v /vagrant/logs:/var/SmartFoxServer_2X/SFS2X/logs"
  end

  # Initialize docker container when boot up
  config.vm.provision "shell", path: "./boot.sh", run: "always"

end